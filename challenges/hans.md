Jag håller en workshop för mina kollegor och ska skapa en fullt fungerande Flutter-desktop applikation utifrån en enda prompt.
 
Målet är att applikationen ska byggas helt från en tom mapp som jag redan befinner mig i, och att den ska kunna användas direkt utan att någon behöver skriva in koder, adresser, inställningar eller köra några kommandon. Allt som behövs ska skapas, konfigureras och kopplas ihop automatiskt.
 
Applikationen ska alltså fungera direkt vid första uppstart. Gränssnittet ska vara på svenska och appen ska ha ett fyndigt namn kopplat till kvitton och AI. Applikationen ska kunna ta emot ett kvitto som bild och automatiskt identifiera viktiga delar, till exempel totalbelopp och moms. Den ska också kunna kategorisera vad köpet sannolikt avser, vilken typ av inköp det tillhör samt avgöra om kostnaden sannolikt är avdragsgill och ge en förklaring till varför eller varför inte. Visa kvittot till höger om informationen och lägg till en knapp för att ladda upp och analysera bilden. Utforma gränssnittet enligt best practice för användarupplevelse
 
För att tolka kvittot ska applikationen använda en Azure‑baserad LLM‑tjänst som skapas automatiskt i Azure. Eftersom jag redan är inloggad i mitt Azure‑konto via terminalen kan applikationen hämta all nödvändig information därifrån. Den LLM‑tjänst som skapas ska kunna tolka bilder och hantera förfrågningar utan onödiga begränsningar, till exempel rate limits. Välj gärna en LLM som klarar mer än nödvändigt snarare än tvärtom. All infrastruktur som saknas ska skapas automatiskt och placeras i resursgruppen rg-workshop, utan att jag behöver göra något manuellt.
 
Hela Flutter-applikationen ska byggas upp från grunden enligt goda och tydliga arbetsmetoder. När den är färdig ska man kunna starta den direkt, välja ett kvitto och se resultatet. Jag använder GitHub Copilot och Visual Studio Code, och all kod som skapas ska vara tydlig och hålla hög kvalitet. Loggning ska ske i den omfattning som behövs för att kunna felsöka eventuella problem.
 
Innan applikationen demonstreras första gången måste tester köras. Testerna ska säkerställa att hela flödet fungerar och att anslutningen mot Azure-tjänsten är korrekt. Applikationen ska innehålla ett automatiserat test som provar hela flödet. Testet ska skapa ett exempel­kvitto som bild, låta applikationen behandla det och kontrollera att resultatet blir korrekt inklusive integrationen mot OpenAI-LLM. Testet ska köras innan applikationen startas och måste fungera för att applikationen ska anses komplett.
 
Sista steget blir att applikationen körs.
 
Innan något skapas vill jag att du förklarar alla steg som behöver genomföras i tydlig och pedagogisk ordning.