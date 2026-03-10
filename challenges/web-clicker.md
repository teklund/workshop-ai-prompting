# 🌐 Spår 2: NetCrack — Cyberpunk Clicker (HTML/JS)

Ett idlespel i webbläsaren: hacka servrar, tjäna credits, köp uppgraderingar, bygg ett imperium. Ingen installation krävs — öppna `index.html` i webbläsaren.

**Förutsättning:** Skapa en ny mapp och öppna den i VS Code:

```bash
mkdir NetCrack
cd NetCrack
```

Skapa en tom fil `index.html` och öppna den. Starta Copilot-chatten (`⌘ + ⇧ + I`).

---

## Steg 1 — Sätt AI:ns personlighet (Custom Instructions)

```text
/create-instruction Act as a Senior Frontend Developer. We are building a dark cyberpunk idle clicker game using only HTML, CSS and vanilla JavaScript — no frameworks, no build tools. ALL user-facing text MUST be in Swedish with a gritty cyberpunk tone. Use a dark UI with neon green accents and monospace fonts.
```

> 💡 Detta skapar `.github/copilot-instructions.md` som gäller för hela projektet.

---

## Steg 2 — Bygg grundstrukturen + första körning

```text
Skapa en komplett index.html med dark cyberpunk-tema. Spelet ska ha: en stor "HACKA"-knapp som ger +1 Credit per klick, en credits-räknare som uppdateras direkt, och en enkel shop med en uppgradering: "Botnet v1" (kostar 10 credits, ger +1 credits per sekund automatiskt). Visa nuvarande credits/sek under räknaren. Neon-grön färgpalett, monospace-font.
```

Öppna `index.html` i webbläsaren och klicka — credits ska ticka upp direkt. ✅

---

## Steg 3 — Bygg ut shopen

```text
Lägg till 3 nya uppgraderingar i shopen med ökande kostnad och effekt: "VPN-tunnel" (50 credits, +5/sek), "Zero-day exploit" (200 credits, ×2 på alla auto-hackers), "Darknet-server" (500 credits, +25/sek). Lägg till en loggsektion som visar de senaste händelserna, t.ex. "[02:14] Botnet hackade München-servern. +1 cr". Uppgraderingar ska gråas ut när man inte har råd.
```

---

## Steg 4 — Lägg till din touch

Bygg vidare med Copilot — välj det som passar dig:

```text
Lägg till en "prestige"-knapp som återställer credits men ger en permanent multiplikator. Visa prestigenivå med en distinkt badge.
```

```text
Lägg till slumpmässiga events — t.ex. "FBI spårar dig! Förlora 20% credits" eller "Sårbarhet hittad! Dubbla credits i 10 sekunder".
```

```text
Lägg till en boss-server som kräver 1000 klick att besegra och ger en stor belöning och en achievement-badge.
```

```text
Lägg till animerade ASCII-art-explosioner och ljudeffekter med Web Audio API vid köp och milstolpar.
```

---

Have fun! 🎉
