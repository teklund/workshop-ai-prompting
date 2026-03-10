# 🖥️ Spår 1: Project Zero-Day (.NET CLI)

Ett Cyberpunk-hackar-spel i terminalen. Grön text, ASCII-art och mörk stämning.

**Förutsättning:** Du har [.NET SDK](https://dotnet.microsoft.com/download) installerat. Skapa ett nytt projekt:

```bash
dotnet new console -n ProjectZeroDay
cd ProjectZeroDay
```

Öppna mappen i VS Code och starta Copilot-chatten (`⌘ + ⇧ + I`).

---

## Steg 1 — Sätt AI:ns personlighet (Custom Instructions)

```text
/create-instruction Act as a Senior .NET Developer. We are building a Cyberpunk CLI hacking simulator. All code must be modern C#. ALL user-facing text MUST be in Swedish with a dark, gritty cyberpunk tone. Use green terminal colors and ASCII art.
```

> 💡 Detta skapar `.github/copilot-instructions.md` som gäller för hela projektet.
> 🇬🇧 Tips: Custom Instructions på engelska ger ofta vassare resultat — men svenska fungerar också!

---

## Steg 2 — Bygg domänen + första körning

```text
Skapa en grundstruktur med Records för Server (Namn, Svårighet, IP, IsHacked) och Player (Alias, Skill, Credits). Skapa en lista med 3 exempelservrar. Skriv sedan ut serverlistan i terminalen med grön färg och en ASCII-rubrik så vi kan köra dotnet run och se något direkt.
```

Kör `dotnet run` — du ska se din serverlista i grönt. ✅

---

## Steg 3 — Lägg till interaktion

```text
Skapa en while-loop som läser kommandon från användaren. Implementera 'lista' (visa servrar), 'hacka [namn]' (slumpmässig framgång/misslyckande med spänningsbyggande text) och 'status' (visa spelarens info). All output ska vara grön.
```

---

## Steg 4 — Lägg till din touch

Bygg vidare med Copilot — välj det som passar dig:

```text
Lägg till ett ASCII-art intro-skärm med spelets namn när programmet startar.
```

```text
Lägg till ett highscore-system som sparas till en fil och visas vid start.
```

```text
Lägg till en 'shop'-mekanism där spelaren kan köpa uppgraderingar med credits.
```

```text
Lägg till ljud med Console.Beep() — olika toner för lyckad hackning vs misslyckande.
```

---

Have fun! 🎉
