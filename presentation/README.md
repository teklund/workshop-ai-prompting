# 🎤 AI-kodkväll — Presentationen

Flutter-baserad slidedeck för workshopen _"Från Gissningar till Pricksäkerhet med GitHub Copilot"_.

🌐 **[Kör presentationen online →](https://teklund.github.io/workshop-ai-prompting/)**

---

## 🚀 Köra presentationen

```bash
cd presentation
flutter run -d chrome    # Webb (rekommenderas för projektor)
flutter run -d macos     # macOS native
```

**Krav:** Flutter SDK installerat. Kör `flutter pub get` först om det är första gången.

### Navigering

| Tangent       | Åtgärd                      |
| :------------ | :-------------------------- |
| `→` / `Space` | Nästa steg / slide          |
| `←`           | Föregående steg / slide     |
| `P`           | Presenter-vy (speakernotes) |
| `F`           | Fullskärm                   |

---

## 📑 Presentationsinnehåll

Nedan följer allt innehåll från presentationen, slide för slide. Kan användas som referens om du inte kan köra Flutter-appen.

---

### Slide 1: Intro

**AI-kodkväll**
_Från Gissningar till Pricksäkerhet med GitHub Copilot_

> **Speakernotes:** Välkomna! Presentera dig själv och kvällens agenda. Setup-check: VS Code, Copilot-extension och aktiv licens redo? Agenda: demo → Zero-Touch Workshop → Show & Tell + prisutdelning.

---

### Slide 2: Vad är GitHub Copilot?

#### Mer än bara "autocomplete"

|     | Titel                             | Beskrivning                                                                                              |
| :-- | :-------------------------------- | :------------------------------------------------------------------------------------------------------- |
| 👥  | **Din AI-Parprogrammerare**       | Sitter bredvid dig, ger förslag, förklarar kod och hjälper till att refaktorera i realtid.               |
| 🔗  | **Bygger på avancerade modeller** | Använder kraftfulla modeller (som Claude Sonnet 4.6) tränade på enorma mängder publik kod.               |
| 👁️  | **Kontext-medveten**              | Den läser vad du har öppet i editorn och förstår strukturen i ditt repository för att ge relevanta svar. |

> **Speakernotes:** Copilot är långt mer än ett autocomplete-verktyg. Det är en AI-parprogrammerare som kan förklara, refaktorera och generera hel kod. Kontextmedveten: ser dina öppna filer och förstår strukturen i ditt repo.

---

### Slide 3: Lägen & Modeller

**Tre lägen i chatten:**

| Läge | Namn                               | Beskrivning                                                                                    |
| :--- | :--------------------------------- | :--------------------------------------------------------------------------------------------- |
| 💬   | **Ask** — Fråga & Lär              | Ställ frågor om kod, arkitektur eller koncept. Ändrar ingenting.                               |
| 🗺️   | **Plan** — Planera innan du bygger | Copilot analyserar uppgiften och skapar en steg-för-steg-plan du godkänner innan koden skrivs. |
| 🤖   | **Agent** — Autonom kodning        | Copilot kör själv: skapar filer, kör terminalen och itererar tills det funkar.                 |

**Välj rätt modell:**

| Modell                  | Beskrivning                                         |
| :---------------------- | :-------------------------------------------------- |
| **Claude Sonnet 4.6** ★ | Rekommenderad — balanserad för kod & agentuppgifter |
| **GPT-5.3-Codex**       | Agentkodning — komplex ingenjörskonst               |
| **Gemini 2.5 Pro**      | Komplex kodgenerering & research                    |
| **Claude Opus 4.6**     | Kraftfullast — sofistikerat resonemang              |

💡 _Spara tokens: GPT-5 mini (gratis) eller Claude Haiku 4.5 (0.33x) för enkla frågor — men räkna med fler hallucinationer._

> **Speakernotes:** Ask ändrar ingenting i koden. Plan skapar en plan du godkänner innan koden skrivs — bra för komplexa uppgifter. Agent kör terminalen, skapar filer och itererar självständigt — granska alltid! Budgetmodeller funkar för enkla frågor men hallucineringar ökar och kontextförståelse minskar.

---

### Slide 4: Prompt-Mönster

#### De Tre Gyllene Mönstren

#### 1. Role Prompting (Ge en roll)

|           | Prompt                                                                                                                                                                |
| :-------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ❌ Undvik | _"Fixa den här koden."_                                                                                                                                               |
| ✅ Prova  | _"Du är en senior C#/.NET-utvecklare. Refaktorera denna klass så att den följer SOLID-principerna, använder dependency injection och är optimerad för ASP.NET Core."_ |

#### 2. Chain of Thought (Steg för steg)

|           | Prompt                                                                                                                                                                                                                                                                            |
| :-------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ❌ Undvik | _"Bygg en order-hantering."_                                                                                                                                                                                                                                                      |
| ✅ Prova  | _"Jag behöver en order-pipeline i C#. Tänk steg för steg: 1. Validera ordern med FluentValidation 2. Kontrollera lagersaldo via IInventoryService 3. Beräkna pris inkl. moms och rabatter 4. Spara via EF Core i en transaktion 5. Publicera ett OrderCreated-event via MediatR"_ |

#### 3. Zero-Shot → Few-Shot

|           | Prompt                                                                                                                                                                     |
| :-------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ❌ Undvik | _"Formatera kundnamn åt mig."_                                                                                                                                             |
| ✅ Prova  | _"Skriv en C#-metod som formaterar kundnamn. Input: "john DOE" → "Doe, John". Input: "ANNA svensson" → "Svensson, Anna". Gör nu samma för alla namn i en List\<string\>."_ |

> **Speakernotes:** Role Prompting: Ge AI:n en professionell roll och bakgrund — höjer kvalitet direkt. Chain of Thought: Be AI:n tänka i numrerade steg innan den kodar — minskar hallucinationer. Zero-Shot → Few-Shot: Visa konkreta in/ut-exempel — AI:n lär sig snabbt av mönster.

---

### Slide 5: Nyckelkoncept

**Tre huvudkoncept:**

| #   | Koncept                 | Beskrivning                                                             |
| :-- | :---------------------- | :---------------------------------------------------------------------- |
| 1   | **Kontext-ankring (#)** | `#file` och `#selection` för precis kontext.                            |
| 2   | **Iterativ Prompting**  | Håll konversationen vid liv och förfina.                                |
| 3   | **Custom Instructions** | Lär Copilot ditt team — språk, arkitektur och regler, en gång för alla. |

#### Bonus — Vill du mer? 🚀

| Koncept                 | Beskrivning                                                                                                             |
| :---------------------- | :---------------------------------------------------------------------------------------------------------------------- |
| **MCP**                 | Koppla Copilot till externa tjänster — databaser, Jira, GitHub.                                                         |
| **Prompt Files**        | Återanvändbara `.prompt.md` versionshanterade i repot.                                                                  |
| **Scoped Instructions** | `.instructions.md` per mapp — olika regler för olika delar av repot.                                                    |
| **Skills**              | Öppen standard för AI-förmågor. Inte bara text — kod, scripts och resurser. Fungerar i alla Copilot-verktyg. Framtiden. |

> **Speakernotes:** `#file` och `#selection` begränsar kontexten till exakt vad AI:n behöver se. Iterativ Prompting — första svaret är sällan perfekt, fortsätt och förfina. Custom Instructions — permanenta regler i `.github/copilot-instructions.md`. Skills paketerar domänkunskap som agenten kan läsa in — t.ex. projektkonventioner, API-mönster eller teststrategier.

---

### Slide 6: Kommandon & Kontextvariabler

**Kommandon:**

| Kommando   | Beskrivning                                                                                          |
| :--------- | :--------------------------------------------------------------------------------------------------- |
| `/explain` | Markera kod och få den förklarad — logik, mönster och potentiella problem. Perfekt för onboarding.   |
| `/fix`     | Markera felet eller koden. Copilot analyserar orsaken och presenterar en konkret fix med förklaring. |
| `/tests`   | Generera kompletta enhetstester för markerad kod — inklusive edge cases du kanske glömt.             |

**Kontextvariabler — ge AI:n exakt rätt information:**

| Variabel       | Beskrivning                                                                        |
| :------------- | :--------------------------------------------------------------------------------- |
| `#codebase`    | Semantisk sökning i hela repot — utan att öppna en enda fil.                       |
| `#fetch <URL>` | Hämta aktuell dokumentation direkt i chatten. Aldrig mer föråldrad info.           |
| `#changes`     | Referera dina git-ändringar. Skriv commit-meddelanden eller be om code review.     |
| `#problems`    | Referera alla fel i Problems-panelen. "Fixa #problems" i Agent-läge är kraftfullt. |

> **Speakernotes:** `/explain` — perfekt för onboarding eller att förstå legacy-kod. `/fix` — bra live-demo. `/tests` — sparar enormt med tid. `#codebase` — fråga "hur fungerar autentisering?" utan att öppna en enda fil. `#fetch` — visa live med en URL. `#changes` — bra för commit-meddelanden. `#problems` — "Fixa alla fel i #problems" i Agent-läge.

---

### Slide 7: Fallgropar

#### Lita inte blint på maskinen

| Fallgrop                     | Beskrivning                                                                     |
| :--------------------------- | :------------------------------------------------------------------------------ |
| ⚠️ **Hallucinationer**       | Copilot kan självsäkert hitta på metoder som låter rimliga men inte existerar.  |
| 🫧 **Kontext-bubblan**       | Att den ser en fil betyder inte att den förstår hela ditt distribuerade system. |
| 📅 **Föråldrad information** | Modellen kanske inte känner till nya framework-funktioner från förra veckan.    |
| 👁️ **Granska ALLTID**        | Du är piloten. Copilot är... copilot. Läs alltid koden innan du committar.      |

> **Speakernotes:** Copilot kan hitta på metoder med stort självförtroende — testa alltid output. AI:n ser bara det du visar den. Träningsdata har ett cutoff-datum. Du är ansvarig för koden.

---

### Slide 8: Zero-Touch Challenge

🎯 **Uppdraget:** Bygg något med Copilot — ramverk och tema är helt fritt. README:n har två förberedda spår: **Project Zero-Day** (.NET CLI) och **NetCrack** (HTML/JS clicker) — men välj fritt!

| Regel                     | Beskrivning                                                                             |
| :------------------------ | :-------------------------------------------------------------------------------------- |
| 👥 **Team eller solo**    | Kör ensam eller sätt ihop ett lag — max 3 personer.                                     |
| 🚫 **Zero-Touch-regeln**  | Ingen manuell kod — allt genereras av Copilot. Går det fel? Prompta fram en fix.        |
| 🖥️ **Manuell drift OK**   | Du får skapa filer och köra terminalen — men AI:n skriver koden.                        |
| ⏰ **Deadline: kl 20:00** | Show & Tell startar 20:00 — alla visar upp vad de byggt. Se till att ha något att visa! |

🔗 **ai-workshop.teklund.dev**

> **Speakernotes:** Ramverk och tema är fritt. README:n har två förberedda spår: Project Zero-Day (.NET CLI) och NetCrack (HTML/JS clicker) — men det är bara exempel. Ingen manuell kod. Manuell drift OK. Team (max 3) eller solo. Deadline 20:00.

---

## 🏗️ Teknisk stack

- **Flutter** + [flutter_deck](https://pub.dev/packages/flutter_deck) — slidstruktur
- **flutter_animate** — animationer (`.animate(target:)` pattern)
- **Mörkt tema** — bakgrund `#0B0F19`, 16:9 FHD

## 📁 Struktur

```text
lib/
  main.dart                  # App-rot och slideregistrering
  slides/                    # En fil per slide
  components/
    info_row.dart            # Återanvändbart kort (titel + beskrivning)
    mode_card.dart           # Kort för lägen (Ask/Plan/Agent)
    model_chip.dart          # Chip för modellval
    premium_card.dart        # Baskortstil med border och shadow
```

---

## 🧠 "The One Prompt" — Hela presentationen i en enda prompt

> Om du skulle bygga hela denna presentation från scratch med en enda prompt till Copilot i Agent-läge — så är det denna:

```text
Skapa en Flutter-presentation med flutter_deck och flutter_animate för en workshop
"AI-kodkväll — Från Gissningar till Pricksäkerhet med GitHub Copilot".
Mörkt premiumtema, bakgrund #0B0F19, 16:9 FHD. All text på svenska.
Koden och kommentarer på engelska.

Designsystem: Kort med BorderRadius.circular(20), tunn border med alpha 0.3, subtil
box-shadow. Vit bold titel, white70 body. Animationer med flutter_animate extension
methods — .animate(target: stepNumber >= N ? 1.0 : 0.0).fade(duration: 600.ms).slideX().
Inga AnimationControllers.

8 slides i denna ordning med FlutterDeckSlideStepsBuilder för progressiva reveals:

1. INTRO (custom, gradient #1E1E2C → #4A4E69): Titel "AI-kodkväll", underrubrik
   "Från Gissningar till Pricksäkerhet med GitHub Copilot". Pulsande auto_awesome-ikon
   i orangeAccent med glow-effekt.

2. VAD ÄR GITHUB COPILOT (blank, steps: 3): Rubrik "Mer än bara autocomplete".
   3 InfoRow-kort som revealar steg för steg:
   - Din AI-Parprogrammerare (blueAccent) — ger förslag, förklarar kod, refaktorerar
   - Bygger på avancerade modeller (tealAccent) — Claude Sonnet 4.6
   - Kontext-medveten (purpleAccent) — läser öppna filer och förstår repo-strukturen

3. LÄGEN & MODELLER (blank, steps: 6): Rubrik "Tre lägen i chatten".
   3 ModeCard i en Row:
   - Ask (lightBlueAccent) — Fråga & Lär, ändrar ingenting
   - Plan (amberAccent) — Planera innan du bygger, godkänn planen först
   - Agent (greenAccent) — Autonom kodning, skapar filer och kör terminalen
   Sedan "Välj rätt modell" med 4 ModelChip:
   Claude Sonnet 4.6 ★ (rekommenderad, #E8985E), GPT-5.3-Codex, Gemini 2.5 Pro,
   Claude Opus 4.6. Budgettips: GPT-5 mini (gratis) / Claude Haiku 4.5 (0.33x).

4. PROMPT-MÖNSTER (blank, steps: 3): Rubrik "De Tre Gyllene Mönstren".
   3 PremiumCard i en Row med ❌ Undvik / ✅ Prova-jämförelser:
   - Role Prompting (cyanAccent): "Fixa den här koden" →
     "Du är en senior C#/.NET-utvecklare. Refaktorera denna klass..."
   - Chain of Thought (pinkAccent): "Bygg en order-hantering" →
     "Tänk steg för steg: 1. Validera... 2. Kontrollera lagersaldo..."
   - Zero-Shot → Few-Shot (orangeAccent): "Formatera kundnamn" →
     "Input: john DOE → Doe, John..."

5. NYCKELKONCEPT (blank, steps: 7): 3 InfoRow-kort + bonussektion:
   - Kontext-ankring # (blueAccent) — #file och #selection
   - Iterativ Prompting (purpleAccent) — håll konversationen vid liv
   - Custom Instructions (greenAccent) — .github/copilot-instructions.md
   Bonus (steg 4–7, kompakta BonusChip i en Row):
   MCP, Prompt Files (.prompt.md), Scoped Instructions (.instructions.md per mapp),
   Skills (öppen standard, agentskills.io — framtiden).

6. KOMMANDON & KONTEXTVARIABLER (blank, steps: 4):
   3 PremiumCard för /explain (orangeAccent), /fix (redAccent), /tests (cyanAccent).
   Sedan 4 kontextvariabler i en Row:
   #codebase (purpleAccent), #fetch URL (tealAccent), #changes (amberAccent),
   #problems (pinkAccent).

7. FALLGROPAR (blank, steps: 4): Rubrik "Lita inte blint på maskinen". 4 InfoRow:
   - Hallucinationer (purpleAccent) — hittar på metoder som inte existerar
   - Kontext-bubblan (blueAccent) — ser inte hela distribuerade systemet
   - Föråldrad information (orangeAccent) — cutoff-datum på träningsdata
   - Granska ALLTID (redAccent) — du är piloten, Copilot är copilot

8. ZERO-TOUCH CHALLENGE (custom, gradient #0A0E17 → #1A2332, steps: 6):
   Grön (#00FF41) rubrik "🚫⌨️ Zero-Touch Challenge".
   Grön mission-box: "Bygg något med Copilot — ramverk och tema är helt fritt.
   README:n har två förberedda spår: Project Zero-Day (.NET CLI) och NetCrack
   (HTML/JS clicker) — men välj fritt!" Sedan InfoRow: Team/solo max 3 (purpleAccent),
   Zero-Touch-regeln (FF4444), Manuell drift OK utan dotnet-specifik text (00B4D8),
   Deadline 20:00 (orangeAccent).
   Länk "ai-workshop.teklund.dev" (64B5F6) med undertext
   "Regler, presentation och allt du behöver — samlat på ett ställe."

Skapa återanvändbara komponenter: InfoRow (ikon + titel + beskrivning med animate),
ModeCard, ModelChip, PremiumCard (border + shadow). Lägg varje slide i lib/slides/
och komponenter i lib/components/. Registrera alla slides i main.dart.
```
