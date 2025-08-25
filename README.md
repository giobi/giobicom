# Giobi.com - Sviluppo Web e Applicazioni Laravel

Benvenuti nel repository del sito web ufficiale di **Giobi.com**, agenzia specializzata nello sviluppo di siti web e applicazioni Laravel a Milano. Il nostro team combina oltre 15 anni di esperienza nel settore con le tecnologie più moderne per creare soluzioni web innovative e performanti.

## 🚀 La Nostra Missione

Gestiamo ogni progetto con la massima cura, dalla singola landing page ai gestionali web complessi, passando per e-commerce avanzati e strategie di social media marketing. La nostra filosofia **Growth-Driven Design** vede il sito web come uno strumento in crescita continua.

## 🛠️ Caratteristiche Principali

- **Single Page Application (SPA)**: Esperienza utente fluida e reattiva
- **Performance Elevate**: Ottimizzato per Core Web Vitals e velocità di caricamento
- **Design Responsivo**: Ottimizzazione mobile-first per oltre il 50% del traffico mobile con layout migliorato
- **Fighting Game Sprites**: Sistema di icone personalizzate ispirate al mondo dei picchiaduro
- **Tecnologie in Evoluzione**: WordPress e Laravel con codice sviluppato ad hoc
- **Hosting Dedicato**: Server ottimizzati per massime performance
- **Integrazione AI**: Logica di processing per GitHub Copilot e automazioni intelligenti

## 💻 Stack Tecnologico

### Frontend
- **Framework**: Astro / Next.js (Static Export)
- **Styling**: Tailwind CSS
- **Linguaggi**: HTML5, CSS3, JavaScript ES6+, TypeScript
- **Ottimizzazione**: Core Web Vitals, PWA Support

### Backend
- **WordPress**: Plugin personalizzati e temi su misura
- **Laravel**: Applicazioni web robuste e scalabili
- **PHP**: Sviluppo backend moderno
- **Database**: MySQL, PostgreSQL

### DevOps & Tools
- **Deployment**: GitHub Pages, Server dedicati
- **Version Control**: Git con GitHub Actions
- **AI Integration**: GitHub Copilot, automazioni intelligenti
- **Forms**: Formspree.io / Netlify Forms
- **Analytics**: Tracking avanzato e reportistica

### E-commerce
- **WooCommerce**: Soluzioni complete per WordPress
- **Magento**: Partnership per progetti enterprise
- **Integrazioni**: Sincronizzazione con gestionali esistenti

## 📁 Struttura del Progetto
```
giobicom25/
├── public/                 # Contenuti statici (immagini, font, favicon)
├── src/                    # Codice sorgente del sito
│   ├── components/         # Componenti riutilizzabili (Header, Footer, Forms)
│   ├── layouts/            # Layout di pagina responsive
│   ├── pages/              # Pagine del sito (Home, Servizi, Portfolio, Contatti)
│   ├── styles/             # Stili globali e theme personalizzato
│   └── utils/              # Utilities e helper functions
├── agents/                 # Configurazione AI e Copilot
│   ├── agents.md           # Specifiche agenti AI
│   ├── prompts/            # Template prompt per diversi task
│   └── workflows/          # Workflow automatizzati
├── docs/                   # Documentazione tecnica
├── astro.config.mjs        # Configurazione Astro
├── tailwind.config.cjs     # Setup Tailwind personalizzato
├── package.json            # Dipendenze e script
├── postcss.config.cjs      # Configurazione PostCSS
├── home-2024.html          # Homepage legacy per riferimento
└── README.md               # Documentazione principale
```

## 🎮 Fighting Game Theme

Il sito web implementa un tema visivo ispirato ai giochi di combattimento anni '80 e '90:

### Sprite Custom
Tutti i sprites sono stati creati appositamente con stile fighting game:
- **Fist Location**: Location marker con pugno da impatto e effetti
- **Energy Email**: Email con onde energetiche e scintille
- **Power Clock**: Orologio con aura power-up e anelli energetici
- **Special Map**: Mappa mondiale con effetti mossa speciale
- **Thunder Power**: Fulmine con effetti di potenza per l'innovazione

### Palette Colori Fighting Game
- `--color-purple-blue: #4a508e` - Blu violaceo per elementi primari
- `--color-teal-blue: #479dc0` - Azzurro per elementi interattivi
- `--color-golden-yellow: #d99449` - Oro per evidenziazioni
- `--color-orange-brown: #be6a3b` - Arancio per contrasti
- `--color-red: #dc2626` - Rosso per elementi di energia

### Effetti Visivi
- Glass effect per elementi UI
- Neon glow per evidenziazioni
- Gradient text per titoli
- Hover scale per interazioni
- Particle effects per sfondi dinamici

## 🔧 Servizi Specializzati

### 🌐 Sviluppo Web
- **Siti Multilingua**: Traduzioni e localizzazione per mercati internazionali
- **Growth-Driven Design**: Approccio iterativo con incontri mensili e miglioramenti continui
- **Mobile Optimization**: Design mobile-first per dispositivi di ogni dimensione
- **Performance**: Ottimizzazione avanzata per velocità e SEO

### 🛒 E-commerce Solutions
- **WooCommerce**: Negozi online completi su WordPress
- **Magento Enterprise**: Partnership per progetti complessi
- **Integrazioni Custom**: Sincronizzazione con gestionali aziendali
- **Payment Gateway**: Integrazione sistemi di pagamento sicuri

### 📱 Social Media Integration
- **Instagram & Facebook**: Strategie integrate per massima visibilità
- **Content Management**: Gestione contenuti social coordinata
- **Analytics**: Tracking e reportistica social media
- **Automation**: Bot e automazioni per customer service

### 🤖 AI & Automation
- **GitHub Copilot**: Logica di processing per sviluppo assistito
- **Workflow Automation**: GitHub Actions e CI/CD
- **Content Generation**: AI per contenuti e copywriting
- **Code Review**: Automazioni per quality assurance
## 🚀 Come Contribuire / Sviluppare Localmente

Per iniziare a lavorare su questo progetto, segui questi passaggi:

## 📋 Setup & Configuration

For complete setup instructions including Google Maps integration, blog management with Markdown files, and FAQ management, see the detailed [setup.md](setup.md) file.

Quick setup steps:
1. Clone the repository
2. Install dependencies: `npm install`
3. Copy `.env.example` to `.env` and configure your API keys
4. Run development server: `npm run dev`
5. Build for production: `npm run build`

### Prerequisiti
- Node.js (versione 18 o superiore)
- npm o yarn
- Git
- GitHub Copilot (raccomandato per sviluppo assistito)

### Setup Iniziale
```bash
# Clona il repository
git clone https://github.com/giobi/giobicom25.git
cd giobicom25

# Installa le dipendenze
npm install

# Configura GitHub Copilot (se disponibile)
# Assicurati di aver configurato le specifiche in agents/agents.md
```

### Sviluppo
```bash
# Avvia il server di sviluppo con HMR
npm run dev
# Il sito sarà disponibile su http://localhost:3000

# Build per produzione
npm run build

# Preview build di produzione
npm run preview

# Lint del codice
npm run lint

# Test (se configurati)
npm run test
```

### Workflow con GitHub Copilot
1. Consulta `agents/agents.md` per le specifiche degli agenti AI
2. Usa i prompt template in `agents/prompts/` per task comuni
3. Segui i workflow in `agents/workflows/` per processi standardizzati

## 🌐 Deployment

### GitHub Pages (Automatico)
Il progetto è configurato per deployment automatico su GitHub Pages tramite GitHub Actions.

**Configurazione:**
- Branch sorgente: `main`
- Cartella build: `dist/`
- Workflow: `.github/workflows/deploy.yml`
- **URL Live**: https://giobi.github.io/giobicom25

> 📖 **Guida Dettagliata**: Per informazioni complete su deployment, troubleshooting e workflow, consulta [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md)

### Server Dedicato Giobi
Per clienti che richiedono hosting dedicato sui nostri server:
- **Performance**: Server ottimizzati per WordPress e Laravel
- **Sicurezza**: Backup automatici e monitoraggio 24/7
- **Scalabilità**: Resources scaling automatico
- **Support**: Assistenza tecnica specializzata

## 📞 Configurazione Moduli di Contatto

### Formspree.io Integration
```html
<!-- Esempio form contatti -->
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
    <input type="email" name="email" placeholder="La tua email" required>
    <textarea name="message" placeholder="Il tuo messaggio"></textarea>
    <input type="hidden" name="_subject" value="Nuovo contatto da giobi.com">
    <input type="hidden" name="_next" value="https://giobi.com/grazie">
    <button type="submit">Invia Messaggio</button>
</form>
```

### Netlify Forms (Alternativa)
```html
<form name="contact" method="POST" data-netlify="true">
    <input type="email" name="email" placeholder="Email" required>
    <textarea name="message" placeholder="Messaggio"></textarea>
    <button type="submit">Contattaci</button>
</form>
```

## 🤖 Logica di Processing Copilot

### Configurazione Agenti AI
Il progetto utilizza GitHub Copilot con configurazioni personalizzate per:

1. **Code Generation**: Automazione sviluppo componenti
2. **Documentation**: Generazione automatica docs
3. **Testing**: Creazione test automatizzati
4. **Refactoring**: Ottimizzazione codice esistente
5. **Translation**: Gestione contenuti multilingua

Vedi `agents/agents.md` per specifiche complete.

### Prompt Engineering
Template prompt ottimizzati per:
- Sviluppo WordPress themes
- Componenti Laravel
- Ottimizzazione performance
- SEO e accessibilità
- Responsive design

## 📈 Analytics e Monitoraggio

### Performance Tracking
- **Core Web Vitals**: Monitoraggio continuo metriche Google
- **Page Speed**: Ottimizzazione caricamento pagine
- **Mobile Metrics**: Performance su dispositivi mobili
- **SEO Metrics**: Ranking e visibilità

### Business Intelligence
- **Conversion Tracking**: Monitoraggio obiettivi business
- **User Journey**: Analisi percorso utente
- **A/B Testing**: Test iterativi per ottimizzazione
- **ROI Analysis**: Ritorno investimento progetti

## 🎯 Roadmap 2025

### Q1 2025
- [ ] Implementazione AI-driven content generation
- [ ] Ottimizzazione performance Core Web Vitals
- [ ] Expansion multilingua automatizzata

### Q2 2025
- [ ] Laravel 11 migration per progetti backend
- [ ] WordPress Gutenberg custom blocks
- [ ] Progressive Web App features

### Q3 2025
- [ ] E-commerce headless architecture
- [ ] Real-time collaboration tools
- [ ] Advanced analytics dashboard

### Q4 2025
- [ ] Machine learning per UX personalization
- [ ] Blockchain integration per e-commerce
- [ ] Voice interface development

## 🏆 Crediti e Riconoscimenti

**Team Giobi.com:**
- Design ispirato a principi di Growth-Driven Design
- Oltre 15 anni di esperienza nel settore
- Sede a Milano con copertura nazionale
- Partnership tecnologiche con leader di settore

**Tecnologie e Risorse:**
- Icone: Fighting Game Style Sprites - Custom SVG sprites ispirati al mondo dei picchiaduro
- Font: Google Fonts ottimizzati per performance
- Images: Ottimizzazione automatica con lazy loading
- CDN: Distribuzione globale per massima velocità

**Sprite Fighting Game Style:**
- `fist-location.svg` - Icona location con pugno e impatto
- `energy-email.svg` - Email con effetti energetici
- `power-clock.svg` - Orologio con aura power-up
- `special-map.svg` - Mappa con effetto mossa speciale
- `thunder-power.svg` - Fulmine per innovazione continua
- `rocket.svg`, `lightning.svg`, `cart.svg`, `bulb.svg`, `target.svg` - Sprites esistenti per servizi

---

## 📞 Contatti

**Giobi.com - Sviluppo Web a Milano**
- 🌐 Website: [giobi.com](https://giobi.com)
- 📧 Email: info@giobi.com
- 📍 Milano, Italia
- 💼 Consulenza gratuita disponibile

**Specializziamo in:**
- WordPress Development
- Laravel Applications
- E-commerce Solutions
- Social Media Integration
- Performance Optimization
- AI-Assisted Development
