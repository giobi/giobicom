---
title: "Come Mappo Automaticamente i Miei Progetti nel Brain"
date: 2025-11-04
tags: [automation, knowledge-management, laravel, brain]
excerpt: "Ho 20+ progetti attivi. Quando un cliente chiama dopo 6 mesi, non ricordo più che stack usa, che DB ha, chi sono i referenti. Soluzione? Un subagent che analizza repo + email + web e crea documentazione automatica."
reading_time: 8 min
---

# Come Mappo Automaticamente i Miei Progetti nel Brain

## Il Problema: La Memoria dei Progetti

Scenario tipico:

Cliente: "Ciao! Vorremmo aggiungere una feature a ProjectFlow"

Io: "...ProjectFlow? Aspetta... era quello in Laravel o React? E il database era MySQL o PostgreSQL? Chi era il referente tecnico?"

**10-20 progetti attivi. 50+ progetti totali negli ultimi anni.**

Quando passa tempo tra una manutenzione e l'altra, **la memoria si sgretola**.

Nota mentale: "Devo documentare meglio." → Mai fatto.

## Prima Soluzione: Documentazione Manuale

Provato a creare file README dettagliati in ogni repo.

**Problemi**:
1. Nessuno li aggiorna (me compreso)
2. Info sparse: repo + email + appunti cartacei
3. Contesto cliente separato dal contesto tecnico
4. Quando serve, non ricordo dove ho scritto cosa

**Risultato**: README fantasma, documentazione obsoleta, ogni volta ricomincio da zero.

## La Soluzione: Project Analyzer

**Idea**: Un sistema che analizza automaticamente progetti esistenti e crea documentazione strutturata nel brain.

**Input**: Nome progetto (es: "projectflow") + repo GitHub + cliente

**Output**: Due file markdown:
1. `database/projects/projectflow.md` - Info tecnica progetto
2. `database/companies/acme-consulting.md` - Info cliente

**Tempo**: ~2 minuti (automatico).

**Mantenimento**: Zero. Si rigenera quando serve.

## Come Funziona

### Step 1: Analisi Repository

Clone repo temporaneo e analisi struttura:

```bash
cd /tmp
git clone git@github.com:user/projectflow.git
cd projectflow

# Identifico stack
ls app/Models/     # Laravel
ls src/            # React/Vue
ls pages/          # Next.js

# Cerco documentazione
cat README.md
ls docs/
```

**Cosa estraggo**:
- Stack tecnico (framework, linguaggio, DB)
- Entità database (models + migrations)
- Pattern architetturali interessanti
- Timeline sviluppo (date migrations + git history)

### Step 2: Email Search

Cerco tutte le email relative al progetto:

```python
queries = [
    'projectflow',
    'subject:projectflow',
    'ACME Consulting'
]

# Recupero via Gmail API
for query in queries:
    emails = gmail_api.search(query)

# Analizzo:
# - Prima/ultima email → timeline collaborazione
# - Referenti più frequenti (from/to)
# - Feature requests, bug reports, fatture
```

**Cosa estraggo**:
- Timeline collaborazione (es: "2022-03 kickoff, 2023-06 feature X, 2025-11 ultimo contatto")
- Referenti principali (Mario Rossi, Laura Bianchi)
- Pattern comunicazione (tone, frequenza, urgenze)

### Step 3: Web Research

Se c'è un cliente B2B, cerco info online:

```python
search_query = "ACME Consulting Milano software"

# Estraggo da risultati:
# - Ragione sociale completa
# - Sede + contatti
# - Settore / industry
# - LinkedIn
```

**Cosa estraggo**:
- Business info (cosa fa l'azienda)
- Dimensione, anno fondazione
- Website, LinkedIn

### Step 4: Analisi Schema Database

Per progetti con database (Laravel, Rails, Django, etc.):

```bash
# Cerco models
find app/Models -name "*.php"

# Leggo migrations per schema
ls database/migrations/

# Identifico:
# - Entità principali (User, Order, Invoice, etc.)
# - Relazioni (1:N, N:N, polymorphic)
# - Pattern interessanti (versioning, state machine, etc.)
```

**Esempio pattern identificato** (versioning system):

```php
// Document con revisioni parent-child
class Document extends Model {
    public function parent() {
        return $this->belongsTo(self::class, 'document_id');
    }

    public function revisions() {
        return $this->hasMany(self::class, 'document_id');
    }
}

// Codice documento: 2025-123-R2
// (anno-id_originale-revisione)
```

Questo è **riutilizzabile** in altri progetti → lo documento.

## Output: File Markdown Strutturati

### File 1: `database/projects/projectflow.md`

```markdown
---
name: ProjectFlow
client: ACME Consulting
type: gestionale
stack: Laravel, PHP, MySQL
status: produzione
repo: https://github.com/user/projectflow
started: 2022-03
last_updated: 2025-11
---

# ProjectFlow - Gestionale Progetti

**Cliente**: [[database/companies/acme-consulting|ACME Consulting]]
**Repository**: https://github.com/user/projectflow

## Overview

Sistema gestione progetti per ACME Consulting.

Funzionalità:
- Gestione clienti e progetti
- Time tracking operatori
- Fatturazione automatica
- Dashboard manager/operatore

## Stack Tecnico

**Backend**: Laravel 10, PHP 8.2, MySQL
**Frontend**: Livewire + Alpine.js
**Deployment**: GitHub Actions → VPS

## Schema Database

### Entità Principali

1. **Client** - Aziende clienti
   - Relations: projects[], invoices[]

2. **Project** - Progetti
   - client_id
   - status: draft|active|completed|archived
   - Relations: tasks[], timesheets[]

3. **Task** - Attività progetto
   - project_id, user_id
   - estimated_hours, actual_hours
   - Relations: timesheets[]

### Pattern Interessanti

**Timesheet Aggregation**: Calcolo automatico ore da timesheet giornalieri.

**Invoice Generation**: Da task completate → fattura draft.

## Timeline Sviluppo

- 2022-03: Kickoff progetto
- 2022-06: Launch MVP (clienti + progetti)
- 2023-01: Time tracking + fatturazione
- 2023-06: Dashboard avanzate
- 2025-11: Ultimo contatto (richiesta esportazione dati)

## Status Attuale

**Produzione**: Sistema stabile, ~50 utenti attivi.

**Prossime features**: Integrazione contabilità esterna (richiesta 2025-11).
```

### File 2: `database/companies/acme-consulting.md`

```markdown
---
name: ACME Consulting
full_name: ACME Consulting Srl
founded: 2015
industry: Consulenza IT
location: Via Roma 123, 20100 Milano
employees: 10-50
relationship: cliente
status: attivo
website: https://acme-consulting.it
---

# ACME Consulting

**Settore**: Consulenza IT e Digital Transformation
**Sede**: Milano
**Dipendenti**: ~30

## Persone di Riferimento

### Mario Rossi
**Ruolo**: CTO
**Email**: mario.rossi@acme-consulting.it
**Note**: Referente tecnico principale

### Laura Bianchi
**Ruolo**: Project Manager
**Email**: laura.bianchi@acme-consulting.it
**Note**: Coordinamento operativo

## Progetti con Noi

### ProjectFlow
**Tipo**: Gestionale progetti custom
**Status**: Produzione
**Durata**: 3+ anni (2022-presente)

## Timeline Collaborazione

- 2022-03: Primo contatto, kickoff ProjectFlow
- 2022-06: Go-live MVP
- 2023-01: Feature time tracking
- 2025-11: Richiesta integrazione contabilità

## Relationship Status

**Tipo**: Cliente fidelizzato
**Durata**: 3+ anni
**Salute**: ✅ Ottima - richieste periodiche, pagamenti regolari
**Potenziale**: Alto - interesse per nuovi progetti
```

## Workflow Pratico

**Comando**:
```bash
# Input minimo richiesto
analyze-project --name projectflow --repo user/projectflow --client "ACME Consulting"
```

**Esecuzione** (~2 minuti):
1. Clone repo in /tmp
2. Analisi README + models + migrations
3. Cerca 50+ email "projectflow" e "ACME"
4. Web search "ACME Consulting Milano"
5. Genera 2 file markdown
6. Commit automatico nel brain

**Output**:
```
✅ database/projects/projectflow.md (creato)
✅ database/companies/acme-consulting.md (creato)

📊 Analisi completata:
- Stack: Laravel + MySQL
- Entità DB: 8 models principali
- Email trovate: 67
- Timeline: 2022-03 → 2025-11
- Referenti: Mario Rossi (CTO), Laura Bianchi (PM)
```

## Valore Aggiunto

### Prima
- Cliente chiama → "Aspetta, cerco appunti..."
- 10-15 minuti per ricostruire contesto
- Rischio di info sbagliate/obsolete
- Ogni volta si ricomincia da zero

### Dopo
- Cliente chiama → `grep "projectflow" database/projects/`
- 30 secondi per avere tutto il contesto
- Info sempre aggiornate (rigenero quando serve)
- **Wikilinks**: progetti → aziende → persone (navigabile)

### Bonus: Pattern Riutilizzabili

Analizzando 20 progetti, identifico pattern ricorrenti:

**Versioning documents** (3 progetti):
```
Document
  ├─ document_id (parent)
  ├─ revision_number
  └─ code: YYYY-ID-RN
```

**Polymorphic tasks** (5 progetti):
```
Task
  ├─ taskable_id
  └─ taskable_type (Project|Order|...)
```

**Role-based dashboards** (7 progetti):
```
User
  ├─ type: admin|manager|operator
  └─ Routes: /admin/, /manager/, /operator/
```

Questi pattern diventano **template riutilizzabili** per nuovi progetti.

## Limitazioni

**Non è magia**:
- Serve repo accessibile (GitHub/GitLab con SSH)
- Email devono avere keyword cercabili
- Web research funziona per aziende con presenza online

**Non sostituisce**:
- Documentazione tecnica dettagliata (architecture docs, API specs)
- Knowledge domain-specific (business rules complesse)
- Comunicazione umana (call con cliente per capire esigenze)

**È ottimo per**:
- Overview rapido progetto
- Ricostruzione contesto dopo mesi
- Onboarding nuovo developer
- Pattern discovery cross-project

## Estensioni Future

**1. Git History Analysis**:
- Contributors principali
- Commit frequency (progetto attivo o dormiente?)
- Branching strategy

**2. Dependency Check**:
- Versioni outdated (composer/npm)
- Security vulnerabilities
- License compatibility

**3. Code Metrics**:
- LOC (lines of code)
- Cyclomatic complexity
- Test coverage

**4. API Documentation**:
- Estrarre endpoints da routes
- Generare Swagger/OpenAPI draft

**5. Compare Projects**:
- "Quali progetti usano pattern X?"
- "Stack più comune negli ultimi 2 anni?"
- "Cliente medio: quante feature/anno?"

## Conclusioni

**Il brain non è solo per nuove conoscenze.**

È anche per **ricostruire ciò che già sapevi ma hai dimenticato**.

Il **Project Analyzer** fa esattamente questo:

1. Analizza automaticamente progetti esistenti
2. Estrae info tecniche + business + relazionali
3. Crea documentazione strutturata e navigabile
4. Identifica pattern riutilizzabili

**Risultato**: Quando un cliente chiama dopo 6 mesi, **so subito di cosa stiamo parlando**.

Zero ansia. Zero tempo perso. Tutto già lì.

---

**Prossimi post**:
- Come uso il brain per generare preventivi (da progetti simili)
- Pattern riutilizzabili: la mia libreria di "LEGO code"
- Email → Action Items → TODO automatici (integrazione read.ai)

**Repo template** (coming soon): https://github.com/giobi/brain-template

---

**Note**: Il Project Analyzer è parte del mio sistema "Brain" (knowledge base personale). I post precedenti spiegano come funziona il brain:
- Parte 1: Il problema e la soluzione
- Parte 2: Workflow pratici
- Parte 3: Sviluppi futuri
