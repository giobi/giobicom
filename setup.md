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

**Supporto tecnico:** Per assistenza, contatta il team di sviluppo all'indirizzo dev@giobi.com