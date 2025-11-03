# Brain - Parte 1: Quando Notion diventa un problema

**Status**: Serie blog - Parte 1/3
**Created**: 2025-11-03
**Target**: blog.giobi.com
**Categoria**: Knowledge Management
**Tags**: productivity, markdown, git, automation
**Lunghezza target**: 800-1000 parole

**Parametri stile**:
- Formalità: 5/10
- Volgarità: 0/10
- Sarcasmo: 6/10

---

## Il problema: quando gli strumenti diventano distrazioni

Gestisco una decina di progetti contemporaneamente. Cliente A ha un bug urgente sul suo ecommerce, cliente B vuole aggiungere una feature al gestionale, e mentre sto nel mezzo di questi due mi arriva un'email con una proposta per un nuovo progetto. Nel frattempo, alle 2 di notte, mi viene in mente la soluzione perfetta per quel refactoring che rimandavo da settimane.

Il cervello umano non è fatto per tenere traccia di tutto questo. Il mio di sicuro no.

### La trappola degli strumenti perfetti

Uso Notion. Tutt'ora. È un ottimo tool, e probabilmente non lo abbandonerò tanto presto. Ha un grande vantaggio: lo metti in mano a chiunque e capisce. Cliente, collaboratore, parente. Intuitive, visuale, facile.

Ma come developer, c'è un problema: **diventi ossessionato dall'ottimizzare lo strumento invece di usarlo**.

Passi ore a creare template perfetti, a decidere se quella proprietà deve essere un select o un multi-select, a costruire relazioni tra database. Ti ritrovi a pensare "potrei fare uno script per automatizzare questo", "potrei usare le API per integrare quello", "potrei personalizzare quest'altra cosa".

E così lo strumento che doveva salvarti tempo diventa un progetto a sé. Un meta-progetto. Per questo Notion è perfetto per chi non smanetta, ma diventa pericoloso per chi smanetta troppo.

### Il ritorno alle origini

La svolta è stata rendermi conto che avevo già gli strumenti giusti. Da sempre.

**File di testo**: Markdown è solo un modo elegante per dire "file di testo con un po' di formattazione". Niente formati proprietari, niente lock-in. Tra 20 anni questi file saranno ancora leggibili.

Ma c'è di più. Una decente quantità di file di testo, ben strutturati, crea un **NoSQL** che a tratti diventa quasi un **SQL**. Puoi fare query, relazioni, aggregazioni. Solo che invece di tabelle hai file, invece di SQL hai grep e script.

E la cosa interessante: spesso non li modifico neanche io direttamente. Li faccio modificare a Claude, o li modifico su GitHub web interface. L'importante è che siano file di testo standard.

**Git**: Lo conoscevo, lo usavo per il codice, ma nell'ultimo anno mi ha affascinato per un altro aspetto. Non è solo version control per software. È version control per _qualsiasi cosa_. Pensieri, note, diari, documentazione. Ogni modifica è tracciata. Ogni cambiamento ha un commit message. Puoi vedere l'evoluzione nel tempo, fare diff, tornare indietro.

### La convergenza

Poi è arrivato Claude Code. E più in generale, il mondo delle AI da riga di comando.

Improvvisamente questi tre pezzi – editor di testo, Git, AI CLI – si sono incrociati nel punto perfetto.

Posso dire a Claude: "Processa le email di ottobre 2024 e generami un riepilogo di cosa ho fatto". E lui:
- Si collega alle API di Gmail
- Scarica le email
- Le analizza
- Scrive un file markdown
- Lo committa su Git
- Mi dice "fatto"

Non è solo conversazione. È operatività vera. Un assistente che ha accesso diretto al filesystem, a Git, alle API esterne. Può leggere, scrivere, eseguire comandi, fare commit.

Questo ha cambiato tutto.

---

## Cos'è il brain

Il brain è il sistema che è nato da questa convergenza.

Non è un'app. Non è un SaaS. Non è un tool da installare.

**È una cartella con dentro dei testi**. In termini tecnici: una repository Git.

```
brain/
├── boot/          # Chi sono, come lavoro, regole operative
├── log/YYYY/      # Diari tecnici/professionali
├── diary/YYYY/    # Eventi personali
├── database/      # Persone, aziende, progetti
├── todo/          # Task con reminder
├── sketch/        # Idee a caso
└── tools/         # Documentazione API e workflow
```

**Perché è figo che sia così**:

- **Divisi in cartelle**: Ogni tipo di contenuto ha il suo posto. Log professionali separati da diary personali. TODO separati da sketch. Zero confusione, zero "dove avevo scritto quella cosa?"

- **Versionati (Git)**: Ogni modifica è tracciata. Cancelli qualcosa per sbaglio? `git checkout`. Vuoi vedere cosa facevi 6 mesi fa? `git log`. Cambi idea su una decisione? `git revert`. È una time machine per i tuoi pensieri.

- **Sincronizzati (Git)**: Push su GitHub, pull dal laptop, dal server, dal telefono (tramite bot). Funziona ovunque. Niente cloud proprietario, niente "devi pagare per avere sync". Git è il sync.

**Boot**: File di inizializzazione. Claude li legge all'avvio di ogni sessione per sapere chi sono, come lavoro, quali sono le regole operative. È il mio "system prompt" personale.

**Log** e **Diary**: Separati perché hanno audience diverse. Il log è professionale (progetti, clienti, sviluppi tecnici). Il diary è personale (eventi, viaggi, riflessioni). Entrambi hanno formato flessibile: `YYYY-MM-DD-topic.md` per eventi specifici, o `YYYY-MM-gmail-log.md` per riepiloghi mensili auto-generati.

**Database**: Obsidian-style. File markdown con frontmatter YAML che definisce proprietà. Wikilinks per creare relazioni tra entità. Niente database SQL, niente ORM. Solo file di testo con struttura.

**Todo**: Task complessi diventano file dedicati con contesto, checklist, reminder dates. Claude controlla i TODO all'avvio e mi segnala quelli in scadenza.

**Sketch**: La cartella più caotica. Idee buttate lì alle 2 di notte che probabilmente non diventeranno mai nulla. Ma almeno non le perdo.

**Tools**: Documentazione operativa. Ogni sottocartella (`gmail/`, `wordpress/`, `telegram/`) ha istruzioni per le API, esempi di chiamate, script riutilizzabili.

---

## Perché funziona

**Zero dipendenze complesse**: Posso aprire il brain con qualsiasi editor di testo, su qualsiasi sistema operativo, su qualsiasi device. Non dipendo da server, da abbonamenti, da aziende che potrebbero chiudere tra 5 anni.

**Grep basta e avanza**: Cerco "api cloudflare", trovo tutto in mezzo secondo. Cerco il nome di un cliente, vedo tutte le interazioni. Semplice, veloce, deterministico.

**Git come time machine**: Ogni modifica è tracciata. Se cambio idea, `git revert`. Se voglio vedere cosa facevo 6 mesi fa, `git log`. Se cancello qualcosa per sbaglio, `git checkout`.

**Portabilità totale**: Se domani Claude Code non esistesse più, il brain continuerebbe a funzionare. Sono file di testo. Posso usarli con qualsiasi tool, qualsiasi AI, qualsiasi script che scrivo io.

---

## E le API?

Qui viene la parte interessante.

Ho collegato il brain a Gmail. Claude scarica le email e genera automaticamente log professionali e diary personali. Ogni mese. Senza che io debba fare nulla.

Ho collegato Telegram. Posso mandare messaggi al bot e creare sketch, aggiungere TODO, fare query sul brain. Dal telefono, in due secondi.

Sto pianificando di integrare altri servizi. Ma la cosa importante non è _quanti_ servizi ho collegato. È che ho scelto di **fidarmi** di collegare questi servizi.

Dare accesso alle mie email a un'AI. Dargli permessi di scrittura sul filesystem. Fargli eseguire comandi git automaticamente.

Questa fiducia è il vero cambio di paradigma. Non è solo automazione. È delegare operatività reale a un sistema che lavora per me, mentre io faccio altro.

---

**Nella prossima parte**: Come funziona concretamente. Esempi pratici di workflow, dalla ricezione email alla generazione automatica di documentazione.

---

**Serie Brain**:
- **Parte 1: Quando Notion diventa un problema** (questo post)
- Parte 2: Come funziona - Esempi pratici (coming soon)
- Parte 3: Sviluppi futuri e conclusioni (coming soon)
