# Brain - Parte 2: Come funziona in pratica

**Status**: Serie blog - Parte 2/3
**Created**: 2025-11-03
**Target**: blog.giobi.com
**Categoria**: Knowledge Management
**Tags**: automation, api, gmail, workflow
**Lunghezza target**: 1000-1200 parole

**Parametri stile**:
- Formalità: 5/10
- Volgarità: 0/10
- Sarcasmo: 6/10

---

## Dalla teoria alla pratica

[Nella prima parte](link-parte-1) ho spiegato cos'è il brain e perché funziona. Ora vediamo **come** funziona davvero, con esempi concreti.

---

## Workflow 1: Email → Azione → Documentazione

Il primo workflow è quello delle email. Ma non è solo "riassumere le mail".

È:
1. **Leggere una email** (es: "Cliente X chiede configurazione DNS per Google Workspace")
2. **FARE quello che c'è da fare** (accedere Cloudflare API, configurare record MX, verificare propagazione)
3. **Preparare bozza di risposta** ("Ho configurato i DNS come da richiesta, propagazione 5-10 minuti")
4. **Documentare** nel log professionale

**Nota importante**: Preparo bozze, non invio automaticamente. Non ho ancora abbastanza casi studio per dire "l'AI può rispondere sempre senza controllo". Ma preparare la bozza mi risparmia già il 70% del lavoro.

Ogni mese, Claude processa anche tutte le email e genera due file riepilogo:

**Log professionale** (`log/2025/2025-11-gmail-log.md`):
```markdown
## 2025-11-03 - Configurazione DNS progetto XYZ
Cliente ACME richiede setup Google Workspace.
Configurato record MX smtp.google.com.
Email inviata a contatto tecnico.
```

**Diary personale** (`diary/2025/2025-11-gmail-diary.md`):
```markdown
## 2025-11-03
Cena con amici. Discusso idea nuovo progetto personale.
Ordinato libro su Amazon: "The Design of Everyday Things"
```

### Perché separarli?

Log e diary hanno **audience diverse**.

Il log è professionale: potrei condividerlo con collaboratori, clienti, o usarlo per report. Contiene progetti, decisioni tecniche, interazioni di lavoro.

Il diary è personale: eventi sociali, acquisti, viaggi, riflessioni. Roba che non ha senso mischiare con il lavoro.

### Come funziona tecnicamente

1. Claude chiama Gmail API con query temporale (`after:2025/11/01 before:2025/12/01`)
2. Scarica JSON di tutte le email del mese
3. Analizza mittente, oggetto, corpo delle email
4. Categorizza: lavoro vs vita privata
5. Estrae eventi significativi
6. Scrive due file markdown separati
7. Committa su Git: `git add . && git commit -m "Process November emails" && git push`

Tutto automatico. Io dormo, Claude lavora.

---

## Workflow 2: Database entità auto-generato

Dal processing delle email, Claude estrae automaticamente **entità**: persone, aziende, progetti.

### Esempio: Persona

**File**: `database/people/mario-rossi.md`

```yaml
---
name: "Mario Rossi"
email: "mario.rossi@example.com"
company: "[[database/company/acme-corp|ACME Corp]]"
role: "CTO"
relationship: "cliente"
created_at: "2025-11-03"
---

## Timeline
- 2025-11-03: Prima call introduttiva, discusso progetto gestionale
- 2025-11-10: Inviato preventivo per sviluppo feature X
- 2025-11-15: Approvato preventivo, partenza progetto

## Progetti
- [[database/projects/acme-gestionale|ACME Gestionale]]

## Note
Preferisce comunicare via email piuttosto che call.
Decisore tecnico, ma deve passare da CEO per budget.
```

### Esempio: Azienda

**File**: `database/company/acme-corp.md`

```yaml
---
name: "ACME Corp"
type: "Cliente"
website: "https://example-acme.com"
---

## Contatti
- [[database/people/mario-rossi|Mario Rossi]] (CTO)
- [[database/people/lucia-bianchi|Lucia Bianchi]] (CEO)

## Progetti
- [[database/projects/acme-gestionale|ACME Gestionale]]
- [[database/projects/acme-ecommerce|ACME Ecommerce]]

## Storia
Primo contatto ottobre 2025 via referral.
Azienda 50 dipendenti, settore manufacturing.
```

### Wikilinks: il superpotere

I `[[link]]` creano un **grafo navigabile**.

Apro `mario-rossi.md` → vedo azienda → clicco → apro `acme-corp.md` → vedo altri contatti → clicco → apro altro profilo.

È come Obsidian, ma senza bisogno di Obsidian. Funziona con qualsiasi editor che supporta markdown (Obsidian, Logseq, VS Code con plugin, persino GitHub web interface).

---

## Workflow 3: Validazione automatica

Ho aggiunto recentemente un sistema di validazione basato su JSON Schema.

### Definisco lo schema

**File**: `schema/person.json`

```json
{
  "required": ["name"],
  "properties": {
    "name": {"type": "string"},
    "email": {"type": "string", "format": "email"},
    "relationship": {
      "enum": ["cliente", "collaboratore", "fornitore", "partner"]
    }
  }
}
```

### Il sistema valida automaticamente

```bash
$ python tools/brain/validate-frontmatter.py database/people/*.md

❌ mario-rossi.md: Invalid
   • relationship: 'collaboratore esterno' is not one of enum

✅ lucia-bianchi.md: Valid
```

Se qualcosa non quadra, il sistema me lo dice. Fix, commit, push. Zero entropy, zero inconsistenze.

Questo gira anche come pre-commit hook: se provo a committare dati invalidi, Git blocca il commit finché non fixo.

---

## Workflow 4: TODO con reminder

Per task complessi, creo file dedicati nella cartella `todo/`.

**File**: `todo/2025-11-15-upgrade-server-xyz.md`

```markdown
**Reminder Date**: 2025-11-15
**Priority**: 🔥 Alta
**Status**: Pending

## Context
Server XYZ su DigitalOcean ha Ubuntu 20.04 LTS che va in EOL aprile 2025.
Necessario upgrade a 22.04 o 24.04.

## What to Do
- [ ] Backup completo (database + files)
- [ ] Test upgrade su staging
- [ ] Schedulare finestra manutenzione con cliente
- [ ] Eseguire upgrade production
- [ ] Verificare funzionamento servizi
- [ ] Update documentazione

## References
- [Guide Ubuntu upgrade](https://ubuntu.com/server/docs/upgrade-introduction)
- [Database backup/restore](link-interno)
- Contatto cliente: [[database/people/mario-rossi|Mario Rossi]]
```

### Check automatico all'avvio

All'inizio di ogni sessione, Claude controlla:

```bash
$ ls -lht todo/*.md | head -10
```

E mi segnala TODO con reminder scaduti o in scadenza oggi.

"Hey, hai 2 TODO urgenti: upgrade server XYZ (scaduto 3 giorni fa) e call con cliente ABC (oggi pomeriggio)."

Non devo ricordarmi nulla. Il sistema ricorda per me.

---

## Il salto di fiducia: collegare le API

Qui viene la parte che ha cambiato davvero tutto.

Ho dato a Claude accesso alle **API di Gmail**. Può leggere le mie email. Può anche mandarle (tramite draft per sicurezza).

Ho collegato **Telegram**. Posso mandare messaggi al bot e lui crea sketch, aggiunge TODO, fa query sul brain. Dal telefono, mentre sono in metro.

Sto pianificando di integrare altri servizi. Ma non è questione di quanti. È questione di **fiducia**.

### La domanda fondamentale

"Sei disposto a dare a un'AI accesso alle tue email?"

Due anni fa avrei detto no. Oggi dico sì, perché:

1. **Trasparenza**: Tutto quello che Claude fa è versionato su Git. Vedo ogni modifica, ogni commit. Se fa casino, lo vedo subito.

2. **Controllo**: Ho sempre accesso diretto ai file. Posso modificare, cancellare, fare rollback. L'AI è un assistente, non un padrone.

3. **Reversibilità**: Se domani decidessi di disattivare tutto, i miei dati rimangono. Sono file di testo. Non dipendo dall'AI per accedervi.

4. **Value proposition**: Il tempo risparmiato vale il rischio. Invece di passare 2 ore al mese a riorganizzare note, Claude lo fa in 30 secondi. Ogni mese. Per sempre.

### Il mindset shift

Non è automazione classica (se questo allora quello). È **delegazione operativa**.

"Claude, processa le email di ottobre 2024."
"Claude, crea un riepilogo dei progetti attivi."
"Claude, trova tutte le interazioni con cliente XYZ."

Lui esegue. Io faccio altro. Quando torno, il lavoro è fatto.

Questo è possibile solo perché Claude Code ha accesso al filesystem, a Git, alle API. Non è solo chat. È un collaboratore con permessi di scrittura.

---

## Prossimamente

Nella terza e ultima parte: sviluppi futuri, cosa potrebbe diventare il brain, e perché alla fine tutto questo è solo un sistema per non impazzire.

---

**Serie Brain**:
- [Parte 1: Quando Notion diventa un problema](link-parte-1)
- **Parte 2: Come funziona in pratica** (questo post)
- Parte 3: Sviluppi futuri e conclusioni (coming soon)
