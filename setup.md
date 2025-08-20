# Configurazione Moduli di Contatto - Giobi.com

Questo documento contiene le istruzioni per configurare i moduli di contatto del sito giobi.com utilizzando servizi esterni come Formspree o Netlify Forms.

## 🚀 Servizi Consigliati

### 1. Formspree.io (Raccomandato)

**Vantaggi:**
- ✅ Facile integrazione
- ✅ Antispam integrato
- ✅ Notifiche email automatiche
- ✅ Dashboard di gestione
- ✅ Piano gratuito disponibile

**Setup:**

1. **Registrazione:**
   - Vai su [formspree.io](https://formspree.io)
   - Crea un account gratuito
   - Verifica la tua email

2. **Creazione Form:**
   - Nel dashboard, clicca "New Form"
   - Inserisci un nome per il form (es. "Contatti Giobi.com")
   - Copia l'endpoint fornito (es. `https://formspree.io/f/xvgpzqyw`)

3. **Integrazione nel Sito:**
   
   Modifica il file `src/pages/index.astro` alla riga del form di contatto:

   ```html
   <!-- Sostituisci questa riga: -->
   <form class="space-y-6" id="contact-form">
   
   <!-- Con questa: -->
   <form class="space-y-6" action="https://formspree.io/f/IL_TUO_ENDPOINT" method="POST">
   ```

   Aggiungi questi campi nascosti prima del primo input:

   ```html
   <input type="hidden" name="_subject" value="Nuovo contatto da giobi.com" />
   <input type="hidden" name="_next" value="https://giobi.github.io/giobicom25/grazie" />
   <input type="hidden" name="_captcha" value="false" />
   ```

4. **Configurazione Avanzata (Opzionale):**
   
   Nel dashboard Formspree:
   - **Settings > Spam Protection:** Abilita reCAPTCHA
   - **Settings > Notifications:** Configura email di notifica
   - **Settings > Autoresponder:** Imposta risposta automatica

### 2. Netlify Forms (Alternativa)

**Vantaggi:**
- ✅ Integrazione nativa se hosting su Netlify
- ✅ Gestione spam integrata
- ✅ Facile configurazione

**Setup per GitHub Pages:**

```html
<form 
  name="contact" 
  method="POST" 
  data-netlify="true" 
  netlify-honeypot="bot-field"
  action="/success"
>
  <input type="hidden" name="form-name" value="contact" />
  <p style="display: none;">
    <label>
      Don't fill this out if you're human: 
      <input name="bot-field" />
    </label>
  </p>
  <!-- I tuoi campi del form qui -->
</form>
```

### 3. EmailJS (Per Solution Client-Side)

**Setup:**

1. Registrati su [emailjs.com](https://emailjs.com)
2. Crea un servizio email
3. Crea un template
4. Installa EmailJS: `npm install @emailjs/browser`

```javascript
// In src/utils/email.js
import emailjs from '@emailjs/browser';

export const sendEmail = (formData) => {
  return emailjs.send(
    'YOUR_SERVICE_ID',
    'YOUR_TEMPLATE_ID',
    formData,
    'YOUR_PUBLIC_KEY'
  );
};
```

## 📝 Configurazione File

### Aggiornare il Form di Contatto

Nel file `src/pages/index.astro`, sostituisci il form esistente con:

```html
<form 
  class="space-y-6" 
  action="https://formspree.io/f/IL_TUO_ENDPOINT" 
  method="POST"
  id="contact-form"
>
  <!-- Campi nascosti Formspree -->
  <input type="hidden" name="_subject" value="Nuovo contatto da giobi.com" />
  <input type="hidden" name="_next" value="https://giobi.github.io/giobicom25/grazie" />
  <input type="hidden" name="_captcha" value="false" />

  <!-- Nome -->
  <div>
    <label for="name" class="block text-sm font-medium text-secondary-700 mb-2">
      Nome *
    </label>
    <input
      type="text"
      id="name"
      name="name"
      required
      class="w-full px-4 py-3 border border-secondary-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
      placeholder="Il tuo nome"
    />
  </div>

  <!-- Email -->
  <div>
    <label for="email" class="block text-sm font-medium text-secondary-700 mb-2">
      Email *
    </label>
    <input
      type="email"
      id="email"
      name="_replyto"
      required
      class="w-full px-4 py-3 border border-secondary-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
      placeholder="La tua email"
    />
  </div>

  <!-- Messaggio -->
  <div>
    <label for="message" class="block text-sm font-medium text-secondary-700 mb-2">
      Messaggio *
    </label>
    <textarea
      id="message"
      name="message"
      rows="5"
      required
      class="w-full px-4 py-3 border border-secondary-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors resize-none"
      placeholder="Descrivi il tuo progetto..."
    ></textarea>
  </div>

  <!-- Privacy -->
  <div class="flex items-start space-x-3">
    <input
      type="checkbox"
      id="privacy"
      name="privacy"
      required
      class="mt-1 w-5 h-5 text-primary-600 border-secondary-300 rounded focus:ring-primary-500"
    />
    <label for="privacy" class="text-sm text-secondary-600">
      Accetto il trattamento dei dati personali secondo la Privacy Policy *
    </label>
  </div>

  <!-- Submit -->
  <button type="submit" class="w-full btn-primary py-4 text-lg">
    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path>
    </svg>
    Invia Messaggio
  </button>
</form>
```

### Creare Pagina di Ringraziamento

Crea il file `src/pages/grazie.astro`:

```astro
---
import Layout from '@/layouts/Layout.astro';
import Header from '@/components/Header.astro';
import Footer from '@/components/Footer.astro';
import '../styles/global.css';
---

<Layout 
  title="Grazie per il tuo messaggio - Giobi.com"
  description="Grazie per averci contattato. Ti risponderemo il prima possibile."
>
  <Header slot="header" />
  
  <section class="section-padding">
    <div class="container-custom text-center">
      <div class="max-w-2xl mx-auto">
        <div class="text-6xl mb-6">✅</div>
        <h1 class="mb-6">Messaggio Inviato!</h1>
        <p class="text-xl text-secondary-600 mb-8">
          Grazie per averci contattato. Abbiamo ricevuto il tuo messaggio 
          e ti risponderemo entro 24 ore.
        </p>
        <a href="/giobicom25/" class="btn-primary">
          Torna alla Homepage
        </a>
      </div>
    </div>
  </section>

  <Footer slot="footer" />
</Layout>
```

## 🔧 Testing e Debugging

### Test del Form

1. **Deployment:** Pubblica il sito su GitHub Pages
2. **Test invio:** Compila e invia il form di test
3. **Verifica email:** Controlla di aver ricevuto l'email
4. **Controlla dashboard:** Verifica i messaggi nel dashboard Formspree

### Troubleshooting Comune

**Problema:** Form non funziona in locale
- **Soluzione:** I servizi come Formspree funzionano solo su domini pubblici

**Problema:** Email non arrivano
- **Soluzione:** Controlla cartella spam e verifica configurazione email

**Problema:** Errore CORS
- **Soluzione:** Assicurati che il dominio sia autorizzato nel dashboard del servizio

## 📧 Configurazione Email Avanzata

### Template Email Personalizzato (Formspree Pro)

```html
<!-- Template per notifiche -->
<h2>Nuovo contatto da giobi.com</h2>
<p><strong>Nome:</strong> {{name}}</p>
<p><strong>Email:</strong> {{_replyto}}</p>
<p><strong>Messaggio:</strong></p>
<blockquote>{{message}}</blockquote>
```

### Autoresponder

```html
<!-- Risposta automatica al cliente -->
<h2>Grazie per averci contattato!</h2>
<p>Caro {{name}},</p>
<p>Abbiamo ricevuto il tuo messaggio e ti risponderemo entro 24 ore.</p>
<p>Il team di Giobi.com</p>
```

## 🔐 Sicurezza e Privacy

### GDPR Compliance

1. **Privacy Policy:** Aggiorna la privacy policy
2. **Consenso:** Checkbox obbligatorio per il consenso
3. **Data Retention:** Configura eliminazione automatica dopo X giorni
4. **Export Data:** Possibilità di esportare/eliminare dati utente

### Protezione Spam

1. **Honeypot:** Campo nascosto per bot
2. **reCAPTCHA:** Integrazione Google reCAPTCHA
3. **Rate Limiting:** Limite invii per IP
4. **Whitelist:** Domini email autorizzati

## 📊 Analytics e Monitoraggio

### Google Analytics Events

```javascript
// Tracciamento invio form
gtag('event', 'form_submit', {
  'event_category': 'contact',
  'event_label': 'contact_form'
});
```

### Webhook Integration

Per integrazioni avanzate (CRM, notifiche Slack, etc.):

```javascript
// Webhook endpoint per processare form data
const webhook = 'https://hooks.zapier.com/hooks/catch/...';
```

---

## 🚀 Deploy Checklist

- [ ] Account Formspree creato e verificato
- [ ] Endpoint form configurato
- [ ] Form aggiornato con azione corretta
- [ ] Pagina di ringraziamento creata
- [ ] Test invio form completato
- [ ] Email di notifica funzionanti
- [ ] Privacy policy aggiornata
- [ ] Protezione spam attivata

---

## 🗺️ Configurazione Google Maps

### Ottenere API Key Google Maps

1. **Accedi alla Google Cloud Console:**
   - Vai su [console.cloud.google.com](https://console.cloud.google.com)
   - Accedi con il tuo account Google
   - Crea un nuovo progetto o seleziona un progetto esistente

2. **Abilita l'API Maps JavaScript:**
   - Nel menu laterale, vai su "API e servizi" > "Libreria"
   - Cerca "Maps JavaScript API"
   - Clicca su "ABILITA"

3. **Crea le credenziali:**
   - Vai su "API e servizi" > "Credenziali"
   - Clicca su "CREA CREDENZIALI" > "Chiave API"
   - Copia la chiave API generata

4. **Configura le restrizioni (importante per sicurezza):**
   - Clicca sulla chiave API appena creata
   - In "Restrizioni applicazione" seleziona "Referrer HTTP"
   - Aggiungi i domini autorizzati:
     ```
     https://giobi.github.io/giobicom25/*
     https://localhost:4321/*
     ```

### Integrazione nel Sito

1. **Installa dipendenze:**
   ```bash
   npm install @googlemaps/js-api-loader
   ```

2. **Crea il componente Maps:**
   
   Crea il file `src/components/GoogleMap.astro`:

   ```astro
   ---
   // src/components/GoogleMap.astro
   export interface Props {
     apiKey: string;
     center?: { lat: number; lng: number };
     zoom?: number;
     height?: string;
   }

   const { 
     apiKey, 
     center = { lat: 45.9127, lng: 8.5595 }, // Verbania, Italy
     zoom = 15,
     height = "400px"
   } = Astro.props;
   ---

   <div id="map" style={`height: ${height}; width: 100%;`} class="rounded-lg"></div>

   <script define:vars={{ apiKey, center, zoom }}>
     // Carica Google Maps API
     function initMap() {
       const map = new google.maps.Map(document.getElementById("map"), {
         zoom: zoom,
         center: center,
         styles: [
           // Stile dark per matching con il tema del sito
           { elementType: "geometry", stylers: [{ color: "#212121" }] },
           { elementType: "labels.icon", stylers: [{ visibility: "off" }] },
           { elementType: "labels.text.fill", stylers: [{ color: "#757575" }] },
           { elementType: "labels.text.stroke", stylers: [{ color: "#212121" }] },
           {
             featureType: "administrative",
             elementType: "geometry",
             stylers: [{ color: "#757575" }]
           },
           {
             featureType: "road",
             elementType: "geometry.fill",
             stylers: [{ color: "#2c2c2c" }]
           },
           {
             featureType: "road",
             elementType: "labels.text.fill",
             stylers: [{ color: "#8a8a8a" }]
           },
           {
             featureType: "water",
             elementType: "geometry",
             stylers: [{ color: "#000000" }]
           }
         ]
       });

       // Aggiungi marker per la location
       new google.maps.Marker({
         position: center,
         map: map,
         title: "Giobi.com - Sviluppo Web",
         icon: {
           path: google.maps.SymbolPath.CIRCLE,
           scale: 10,
           fillColor: "#4ade80", // green-400
           fillOpacity: 1,
           strokeWeight: 2,
           strokeColor: "#ffffff"
         }
       });
     }

     // Carica l'API e inizializza la mappa
     function loadGoogleMaps() {
       const script = document.createElement('script');
       script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&callback=initMap`;
       script.async = true;
       script.defer = true;
       document.head.appendChild(script);
     }

     // Inizializza quando il DOM è pronto
     if (document.readyState === 'loading') {
       document.addEventListener('DOMContentLoaded', loadGoogleMaps);
     } else {
       loadGoogleMaps();
     }
   </script>
   ```

3. **Configura le variabili d'ambiente:**
   
   Crea il file `.env` nella root del progetto:
   ```bash
   # .env
   GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
   ```

   Aggiungi `.env` al `.gitignore` se non è già presente.

4. **Aggiorna la pagina index.astro:**
   
   Nel file `src/pages/index.astro`, sostituisci il placeholder della mappa:

   ```astro
   ---
   import GoogleMap from '@/components/GoogleMap.astro';
   // ... altre importazioni
   
   const GOOGLE_MAPS_API_KEY = import.meta.env.GOOGLE_MAPS_API_KEY || 'YOUR_API_KEY_HERE';
   ---

   <!-- Sostituisci il Map placeholder con: -->
   <div class="retro-border bg-black p-6">
     <div class="mb-4">
       <h4 class="text-green-300 font-mono uppercase tracking-wider text-lg">📍 Dove Siamo</h4>
     </div>
     <GoogleMap 
       apiKey={GOOGLE_MAPS_API_KEY}
       center={{ lat: 45.9127, lng: 8.5595 }}
       zoom={15}
       height="300px"
     />
     <div class="mt-4 text-center">
       <p class="text-green-500 font-mono text-sm">Verbania (VB), Italia</p>
     </div>
   </div>
   ```

### Testing e Debugging

1. **Verifica che l'API key funzioni:**
   - Apri gli strumenti sviluppatore del browser
   - Controlla la console per errori relativi a Google Maps
   - Verifica che la mappa carichi correttamente

2. **Errori comuni:**
   - **"API key not valid"**: Verifica che l'API key sia corretta e che l'API Maps JavaScript sia abilitata
   - **"RefererNotAllowedMapError"**: Aggiungi il dominio nelle restrizioni dell'API key
   - **Mappa grigia**: Controlla che ci siano crediti sufficienti nell'account Google Cloud

---

## 📝 Gestione Blog con File Markdown

### Configurazione Content Collections (Astro)

1. **Configura Content Collections:**
   
   Aggiorna il file `astro.config.mjs`:

   ```javascript
   // astro.config.mjs
   import { defineConfig } from 'astro/config';
   import tailwind from '@astrojs/tailwind';
   import sitemap from '@astrojs/sitemap';

   export default defineConfig({
     site: 'https://giobi.github.io',
     base: '/giobicom25',
     integrations: [tailwind(), sitemap()],
     markdown: {
       shikiConfig: {
         theme: 'github-dark',
         wrap: true
       }
     }
   });
   ```

2. **Crea la configurazione delle collections:**
   
   Crea il file `src/content/config.ts`:

   ```typescript
   // src/content/config.ts
   import { defineCollection, z } from 'astro:content';

   const blog = defineCollection({
     type: 'content',
     schema: z.object({
       title: z.string(),
       description: z.string(),
       author: z.string().default('giobi.com'),
       date: z.date(),
       tags: z.array(z.string()).default([]),
       draft: z.boolean().default(false),
       featured: z.boolean().default(false),
       image: z.string().optional(),
     }),
   });

   export const collections = {
     blog: blog,
   };
   ```

3. **Crea la struttura delle cartelle:**
   ```bash
   mkdir -p src/content/blog
   ```

### Creazione Post del Blog

1. **Struttura dei file Markdown:**
   
   Crea i post nella cartella `src/content/blog/`. Esempio `src/content/blog/laravel-best-practices.md`:

   ```markdown
   ---
   title: "Laravel Best Practices: Guida Completa 2025"
   description: "Scopri le migliori pratiche per sviluppare applicazioni Laravel performanti e mantenibili."
   author: "giobi.com"
   date: 2024-01-15
   tags: ["Laravel", "PHP", "Best Practices", "Web Development"]
   featured: true
   image: "/images/blog/laravel-best-practices.jpg"
   ---

   # Laravel Best Practices: Guida Completa 2025

   Laravel è uno dei framework PHP più popolari al mondo, e per una buona ragione. In questo articolo esploreremo le migliori pratiche per sviluppare applicazioni Laravel moderne e performanti.

   ## 1. Struttura del Progetto

   ### Organizzazione dei File
   
   Mantieni una struttura pulita seguendo le convenzioni Laravel:

   ```php
   app/
   ├── Http/
   │   ├── Controllers/
   │   ├── Middleware/
   │   └── Requests/
   ├── Models/
   ├── Services/
   └── Repositories/
   ```

   ### Naming Conventions

   - **Models**: Singolare, PascalCase (`User`, `BlogPost`)
   - **Controllers**: PascalCase + "Controller" (`UserController`)
   - **Migrations**: snake_case con timestamp
   
   ## 2. Database e Eloquent

   ### Relationship Definitions
   
   ```php
   class User extends Model
   {
       public function posts()
       {
           return $this->hasMany(Post::class);
       }
   }
   ```

   ## Conclusioni

   Seguendo queste pratiche, potrai sviluppare applicazioni Laravel più robuste e facili da mantenere.
   ```

2. **Esempi di post aggiuntivi:**
   
   Crea `src/content/blog/wordpress-custom-themes.md`:

   ```markdown
   ---
   title: "Sviluppo Temi WordPress Custom: Guida Pratica"
   description: "Come creare temi WordPress personalizzati da zero utilizzando le moderne best practices."
   date: 2024-01-10
   tags: ["WordPress", "PHP", "Temi", "Custom Development"]
   ---

   # Sviluppo Temi WordPress Custom

   Creare temi WordPress personalizzati ti permette di avere il controllo completo...
   ```

### Aggiornamento della Pagina Blog

1. **Aggiorna `src/pages/blog.astro`:**

   ```astro
   ---
   import Layout from '@/layouts/Layout.astro';
   import Header from '@/components/Header.astro';
   import Footer from '@/components/Footer.astro';
   import { getCollection } from 'astro:content';
   import '../styles/global.css';

   // Ottieni tutti i post del blog
   const allPosts = await getCollection('blog');
   
   // Filtra i post non bozza e ordina per data
   const posts = allPosts
     .filter(post => !post.data.draft)
     .sort((a, b) => b.data.date.valueOf() - a.data.date.valueOf());
   ---

   <Layout 
     title="Blog - giobi.com - Sviluppo Web e Laravel"
     description="Blog tecnico di giobi.com con articoli su Laravel, WordPress, sviluppo web e tecnologie moderne."
   >
     <Header slot="header" />
     
     <section class="section-padding bg-black">
       <div class="container-custom">
         <div class="text-center mb-16">
           <h1 class="mb-6 text-green-300">[ BLOG ]</h1>
           <p class="text-xl text-green-500 max-w-3xl mx-auto font-mono">
             Articoli tecnici su Laravel, WordPress e sviluppo web.<br>
             <span class="text-green-400">></span> Condividiamo la nostra esperienza e le migliori pratiche.
           </p>
         </div>
         
         {posts.length > 0 ? (
           <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
             {posts.map((post) => (
               <article class="retro-border bg-black p-6 hover:bg-gray-900 transition-colors">
                 <div class="mb-4">
                   <h2 class="text-xl font-bold mb-2 text-green-300 uppercase tracking-wider">
                     <a href={`/giobicom25/blog/${post.slug}`} class="hover:text-green-200 transition-colors">
                       {post.data.title}
                     </a>
                   </h2>
                   <div class="text-sm text-green-500 font-mono mb-2">
                     {post.data.date.toLocaleDateString('it-IT')} - {post.data.author}
                   </div>
                 </div>
                 <p class="text-green-500 font-mono text-sm mb-4">{post.data.description}</p>
                 <div class="flex flex-wrap gap-2 mb-4">
                   {post.data.tags.map((tag) => (
                     <span class="px-2 py-1 border border-green-400 text-green-400 text-xs font-mono uppercase">
                       {tag}
                     </span>
                   ))}
                 </div>
                 <a href={`/giobicom25/blog/${post.slug}`} class="text-green-300 hover:text-green-200 font-mono text-sm uppercase tracking-wider">
                   > Leggi tutto
                 </a>
               </article>
             ))}
           </div>
         ) : (
           <div class="text-center">
             <div class="retro-border bg-black p-8 max-w-2xl mx-auto">
               <h2 class="text-2xl font-bold mb-4 text-green-300 uppercase tracking-wider">Nessun Post Disponibile</h2>
               <p class="text-green-500 font-mono">
                 I post del blog verranno pubblicati presto. Seguici per rimanere aggiornato!
               </p>
             </div>
           </div>
         )}
       </div>
     </section>

     <Footer slot="footer" />
   </Layout>
   ```

2. **Crea il template per i singoli post:**
   
   Crea il file `src/pages/blog/[...slug].astro`:

   ```astro
   ---
   import Layout from '@/layouts/Layout.astro';
   import Header from '@/components/Header.astro';
   import Footer from '@/components/Footer.astro';
   import { getCollection } from 'astro:content';
   import '../../styles/global.css';

   export async function getStaticPaths() {
     const posts = await getCollection('blog');
     return posts.map((post) => ({
       params: { slug: post.slug },
       props: post,
     }));
   }

   const post = Astro.props;
   const { Content } = await post.render();
   ---

   <Layout 
     title={`${post.data.title} - Blog giobi.com`}
     description={post.data.description}
   >
     <Header slot="header" />
     
     <article class="section-padding bg-black">
       <div class="container-custom max-w-4xl">
         <!-- Post Header -->
         <header class="mb-12 text-center">
           <h1 class="text-4xl font-bold mb-4 text-green-300 uppercase tracking-wider">
             {post.data.title}
           </h1>
           <div class="text-green-500 font-mono mb-6">
             {post.data.date.toLocaleDateString('it-IT')} - {post.data.author}
           </div>
           <div class="flex flex-wrap justify-center gap-2">
             {post.data.tags.map((tag) => (
               <span class="px-3 py-1 border border-green-400 text-green-400 text-sm font-mono uppercase">
                 {tag}
               </span>
             ))}
           </div>
         </header>

         <!-- Post Content -->
         <div class="prose prose-invert prose-green max-w-none">
           <Content />
         </div>

         <!-- Navigation -->
         <footer class="mt-16 pt-8 border-t border-green-400">
           <div class="text-center">
             <a href="/giobicom25/blog" class="btn-primary">
               ← Torna al Blog
             </a>
           </div>
         </footer>
       </div>
     </article>

     <Footer slot="footer" />
   </Layout>
   ```

### Aggiungere Supporto Syntax Highlighting

1. **Installa dipendenze per syntax highlighting:**
   ```bash
   npm install @astrojs/prism
   ```

2. **Aggiungi CSS per il syntax highlighting:**
   
   In `src/styles/global.css` aggiungi:

   ```css
   /* Syntax highlighting per code blocks */
   .prose pre {
     @apply bg-gray-900 border border-green-400 rounded-lg p-4 overflow-x-auto;
   }

   .prose code {
     @apply text-green-400 bg-gray-900 px-1 py-0.5 rounded text-sm;
   }

   .prose pre code {
     @apply bg-transparent p-0 text-green-300;
   }
   ```

---

## ❓ Gestione FAQ

### Configurazione FAQ con Content Collections

1. **Estendi la configurazione delle collections:**
   
   Aggiorna `src/content/config.ts`:

   ```typescript
   // src/content/config.ts
   import { defineCollection, z } from 'astro:content';

   const blog = defineCollection({
     type: 'content',
     schema: z.object({
       title: z.string(),
       description: z.string(),
       author: z.string().default('giobi.com'),
       date: z.date(),
       tags: z.array(z.string()).default([]),
       draft: z.boolean().default(false),
       featured: z.boolean().default(false),
       image: z.string().optional(),
     }),
   });

   const faq = defineCollection({
     type: 'content',
     schema: z.object({
       question: z.string(),
       category: z.string(),
       order: z.number().default(0),
       featured: z.boolean().default(false),
     }),
   });

   export const collections = {
     blog: blog,
     faq: faq,
   };
   ```

2. **Crea la struttura FAQ:**
   ```bash
   mkdir -p src/content/faq
   ```

### Creazione delle FAQ

1. **Esempio FAQ files:**
   
   Crea `src/content/faq/prezzi-sviluppo-web.md`:

   ```markdown
   ---
   question: "Quanto costa sviluppare un sito web?"
   category: "Prezzi"
   order: 1
   featured: true
   ---

   Il costo di sviluppo di un sito web varia in base a diversi fattori:

   ## Tipologie di Progetti

   ### Sito Vetrina (€800 - €2.500)
   - 5-10 pagine statiche
   - Design responsive
   - Ottimizzazione SEO base
   - Form di contatto

   ### Sito Aziendale (€2.500 - €8.000)
   - Design personalizzato
   - CMS per gestione contenuti
   - Integrazione social
   - Analytics e tracking

   ### E-commerce (€5.000 - €15.000+)
   - Catalogo prodotti
   - Sistema di pagamento
   - Gestione ordini
   - Integrazione magazzino

   ### Web Application (€10.000+)
   - Funzionalità specifiche
   - Area riservata utenti
   - Database complessi
   - API integrations

   **Contattaci per un preventivo personalizzato gratuito!**
   ```

   Crea `src/content/faq/tempi-sviluppo.md`:

   ```markdown
   ---
   question: "Quali sono i tempi di sviluppo?"
   category: "Tempi"
   order: 2
   featured: true
   ---

   I tempi di sviluppo dipendono dalla complessità del progetto:

   ## Timeline Tipiche

   ### Sito Vetrina: 2-4 settimane
   - Briefing e analisi: 3-5 giorni
   - Design e prototipo: 1 settimana
   - Sviluppo: 1-2 settimane
   - Test e ottimizzazioni: 3-5 giorni

   ### Sito Aziendale: 4-8 settimane
   - Analisi requisiti: 1 settimana
   - UX/UI Design: 2 settimane
   - Sviluppo frontend/backend: 3-4 settimane
   - Testing e deploy: 1 settimana

   ### E-commerce: 8-16 settimane
   - Planning e architettura: 2 settimane
   - Design sistema: 2-3 settimane
   - Sviluppo core: 4-8 settimane
   - Integrations e testing: 2-3 settimane

   **Nota:** I tempi possono variare in base alla disponibilità di contenuti e feedback del cliente.
   ```

   Crea `src/content/faq/tecnologie-utilizzate.md`:

   ```markdown
   ---
   question: "Quali tecnologie utilizzate?"
   category: "Tecnologie"
   order: 3
   ---

   Utilizziamo le tecnologie più moderne e affidabili del mercato:

   ## Frontend
   - **HTML5, CSS3, JavaScript ES6+**
   - **React, Vue.js, Astro** per applicazioni moderne
   - **Tailwind CSS** per styling rapido
   - **TypeScript** per progetti complessi

   ## Backend
   - **Laravel (PHP)** - Il nostro framework principale
   - **Node.js** per applicazioni real-time
   - **Python/Django** per progetti specifici

   ## Database
   - **MySQL/PostgreSQL** per database relazionali
   - **MongoDB** per dati non strutturati
   - **Redis** per caching

   ## CMS
   - **WordPress** - Personalizzazioni e temi custom
   - **Headless CMS** (Strapi, Contentful)

   ## DevOps
   - **Git** per version control
   - **Docker** per containerizzazione
   - **AWS/DigitalOcean** per hosting
   - **GitHub Actions** per CI/CD

   La scelta della tecnologia dipende sempre dalle specifiche esigenze del progetto.
   ```

### Aggiornamento della Pagina FAQ

1. **Aggiorna `src/pages/faq.astro`:**

   ```astro
   ---
   import Layout from '@/layouts/Layout.astro';
   import Header from '@/components/Header.astro';
   import Footer from '@/components/Footer.astro';
   import { getCollection } from 'astro:content';
   import '../styles/global.css';

   // Ottieni tutte le FAQ
   const allFaqs = await getCollection('faq');
   
   // Ordina le FAQ per categoria e ordine
   const faqs = allFaqs.sort((a, b) => {
     // Prima per categoria
     if (a.data.category !== b.data.category) {
       return a.data.category.localeCompare(b.data.category);
     }
     // Poi per ordine
     return a.data.order - b.data.order;
   });

   // Raggruppa per categoria
   const faqsByCategory = faqs.reduce((acc, faq) => {
     const category = faq.data.category;
     if (!acc[category]) {
       acc[category] = [];
     }
     acc[category].push(faq);
     return acc;
   }, {});
   ---

   <Layout 
     title="FAQ - giobi.com - Domande Frequenti"
     description="Domande frequenti sui servizi di sviluppo web di giobi.com. Trova risposte sui nostri servizi Laravel e WordPress."
   >
     <Header slot="header" />
     
     <section class="section-padding bg-black">
       <div class="container-custom">
         <div class="text-center mb-16">
           <h1 class="mb-6 text-green-300">[ FAQ ]</h1>
           <p class="text-xl text-green-500 max-w-3xl mx-auto font-mono">
             Domande frequenti sui nostri servizi di sviluppo web.<br>
             <span class="text-green-400">></span> Non trovi la risposta che cerchi? Contattaci direttamente.
           </p>
         </div>
         
         {Object.keys(faqsByCategory).length > 0 ? (
           <div class="max-w-4xl mx-auto">
             {Object.entries(faqsByCategory).map(([category, categoryFaqs]) => (
               <div class="mb-12">
                 <h2 class="text-2xl font-bold mb-6 text-green-300 uppercase tracking-wider border-b border-green-400 pb-2">
                   {category}
                 </h2>
                 <div class="space-y-6">
                   {categoryFaqs.map(async (faq) => {
                     const { Content } = await faq.render();
                     return (
                       <div class="retro-border bg-black p-6 hover:bg-gray-900 transition-colors">
                         <h3 class="text-xl font-bold mb-4 text-green-300 uppercase tracking-wider">
                           {faq.data.question}
                         </h3>
                         <div class="prose prose-invert prose-green max-w-none text-green-500 font-mono text-sm leading-relaxed">
                           <Content />
                         </div>
                       </div>
                     );
                   })}
                 </div>
               </div>
             ))}
           </div>
         ) : (
           <div class="text-center">
             <div class="retro-border bg-black p-8 max-w-2xl mx-auto">
               <h2 class="text-2xl font-bold mb-4 text-green-300 uppercase tracking-wider">Sezione in Costruzione</h2>
               <p class="text-green-500 font-mono mb-6">
                 Stiamo preparando una sezione FAQ completa. Nel frattempo, contattaci direttamente per qualsiasi domanda.
               </p>
               <div class="mt-6">
                 <a href="/giobicom25/#contatti" class="btn-primary">
                   CONTATTACI PER DOMANDE
                 </a>
               </div>
             </div>
           </div>
         )}
         
         <!-- CTA Section -->
         <div class="mt-16 text-center">
           <div class="retro-border bg-black p-8 max-w-2xl mx-auto">
             <h3 class="text-2xl font-bold mb-4 text-green-300 uppercase tracking-wider">Hai altre domande?</h3>
             <p class="text-green-500 font-mono mb-6">
               Non hai trovato la risposta che cercavi? Contattaci per una consulenza gratuita.
             </p>
             <a href="/giobicom25/#contatti" class="btn-primary">
               RICHIEDI CONSULENZA GRATUITA
             </a>
           </div>
         </div>
       </div>
     </section>

     <Footer slot="footer" />
   </Layout>
   ```

### Aggiungere FAQ al Sito

1. **Per aggiungere nuove FAQ:**
   - Crea un nuovo file `.md` in `src/content/faq/`
   - Compila il frontmatter con `question`, `category`, `order`
   - Scrivi la risposta in Markdown nel body del file

2. **Esempio di nuova FAQ:**
   ```markdown
   ---
   question: "Offrite servizi di manutenzione?"
   category: "Servizi"
   order: 1
   ---

   Sì, offriamo diversi pacchetti di manutenzione:
   
   - **Manutenzione Base**: Aggiornamenti sicurezza, backup mensili
   - **Manutenzione Advanced**: Include monitoraggio 24/7, supporto prioritario
   - **Manutenzione Enterprise**: SLA garantito, sviluppo di nuove funzionalità
   ```

---

**Supporto tecnico:** Per assistenza, contatta il team di sviluppo all'indirizzo dev@giobi.com