# Voxx-Zero: Belgian AI Voice Assistant 🇧🇪

Voxx-Zero is a sovereign, high-fidelity AI voice assistant specifically designed for the Belgian market. Leveraging the **Gemini 2.0 Live API**, it provides real-time, bidirectional audio communication with a deep focus on Belgian administrative efficiency, multilingual support, and seamless WhatsApp integration.

## 🏗️ Architecture

Voxx-Zero is built as a full-stack TypeScript application:

-   **Frontend:** React 19, Vite, Tailwind CSS v4, Framer Motion.
-   **Backend:** Express API (Node.js) acting as a secure proxy for sovereign tools.
-   **AI Core:** Gemini Live API (Multimodal WebSockets) for zero-latency voice interaction.
-   **Database:** Supabase (PostgreSQL) for user settings, tool outputs, and document storage.
-   **WhatsApp:** Hybrid provider support (Baileys & Go-WhatsApp) with secure session isolation.

## ✨ Core Features

### 1. Gemini Live Audio Pipeline
- **Real-time Voice:** Low-latency PCM16 audio streaming via WebSockets.
- **Personality (Beatrice):** A warm, empathetic administrative assistant persona (Beatrice) that remembers your family stories and preferences.
- **Visual Artifacts:** Real-time generation of boardroom-quality documents, contracts, and reports.

### 2. WhatsApp Sovereign Integration
- **Context-Aware Messaging:** Beatrice analyzes your chat history to mimic your personal writing style (tone, abbreviations, language).
- **Safety-First Flow:** Strict 4-step messaging SOP (Resolve -> Disambiguate -> Preview -> Execute).
- **Multi-Device Support:** Secure pairing via QR code or OTP.
- **Belgium Optimized:** Automatic normalization for Belgian mobile formats (`04xx` -> `+324...`).

### 3. The 10 Belgian Administrative Tools
Tailored tools to navigate the "Belgian Paperwork" landscape:
1.  **KBO/CBE Company Intelligence:** Real-time data from the Crossroads Bank for Enterprises.
2.  **VIES VAT Validation:** Instant verification of European VAT numbers.
3.  **Peppol E-Invoicing:** Generation of structured electronic invoices.
4.  **Registration Tax Calculator:** Real estate tax estimations for Flanders, Wallonia, and Brussels.
5.  **Tax & VAT Calendar:** Proactive alerts for Belgian fiscal deadlines.
6.  **Itsme Navigator:** Guidance through the national digital identity system.
7.  **Bilingual Bridge:** Contextual translation between FR ↔ NL.
8.  **RSZ/ONSS Navigator:** Social security compliance for employers and freelancers.
9.  **Labor Law Simplifier:** Plain-English (or Dutch/French) explanations of Belgian labor regulations.
10. **Belgian Mobility:** Real-time NMBS/SNCB and STIB/MIVB route planning.

## 🚀 Getting Started

### Prerequisites
- Node.js 20+
- A Google Gemini API Key
- Supabase Project
- Firebase Project (Auth)

### Installation
```bash
# Clone the repository
git clone https://github.com/lovegold120221-dot/stunning-goggles.git
cd voxx-zero

# Install dependencies
npm install

# Setup environment variables
cp .env.example .env
# Fill in your GEMINI_API_KEY, SUPABASE_URL, etc.
```

### Development
```bash
# Start both frontend and backend
npm run dev:full

# Start backend only
npm run dev:api

# Start frontend only
npm run dev
```

### Deployment
The project is optimized for deployment on Ubuntu VPS using PM2 and Nginx.
```bash
# Build production assets
npm run build

# Start with PM2
pm2 start ecosystem.config.cjs
```

## 🔒 Security & Privacy
- **Sovereign Sessions:** WhatsApp sessions are stored locally on the server in `.baileys_auth` and are never exposed to the client.
- **Permission Gates:** Granular user toggles for every tool and data access point.
- **Confidentiality:** Audio data is processed in-memory and not stored by the assistant.

## 📜 License
Private Project - Eburon AI / Voxx-Zero
