# Blog

Articoli tecnici su sviluppo, automazione e knowledge management.

---

## [Come Mappo Automaticamente i Miei Progetti nel Brain](project-analyzer.md)

**Data**: 4 novembre 2025 • **Lettura**: 8 min

Ho 20+ progetti attivi. Quando un cliente chiama dopo 6 mesi, non ricordo più che stack usa, che DB ha, chi sono i referenti. Soluzione? Un subagent che analizza repo + email + web e crea documentazione automatica.

**Cosa copre**:
- Analisi automatica repository (models, migrations, patterns)
- Email search per timeline e referenti
- Web research su aziende clienti
- Generazione file markdown strutturati
- Pattern riutilizzabili identificati cross-project

**Output**: `database/projects/{nome}.md` + `database/companies/{cliente}.md`

**Temi**: automation, knowledge management, Laravel, pattern discovery, subagent

---

## Serie Brain - Knowledge Management System (2025-11)

Un sistema personale per non impazzire con 10 progetti, 50 clienti, e idee che arrivano alle 2 di notte.

### [Parte 1: Quando Notion diventa un problema](brain-parte-1.md)

Il problema: troppi progetti, Notion che diventa un meta-progetto. La convergenza tra editor di testo, Git e AI. Perché file di testo + Git + Claude Code è la soluzione.

**Temi**: Notion, markdown, Git, Claude Code, convergenza tools

---

### [Parte 2: Come funziona in pratica](brain-parte-2.md)

Workflow concreti: email → azione → documentazione. Database entità auto-generato. Validazione automatica. TODO con reminder. Il salto di fiducia nel collegare API.

**Temi**: Gmail API, automazione, validation, database NoSQL, delegazione operativa

---

### [Parte 3: Cosa manca e perché va bene così](brain-parte-3.md)

Sviluppi futuri (query API, graph visualization, Telegram bot, health check). Cosa NON farò (vector DB, UI complessa, SaaS). Potrebbe diventare un prodotto template open source.

**Temi**: roadmap, filosofia, template GitHub, future

---

**Repository template**: https://github.com/giobi/brain
**Contatti**: giobi@giobi.com
