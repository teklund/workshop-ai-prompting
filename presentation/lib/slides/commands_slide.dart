import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../components/premium_card.dart';

class CommandsSlide extends FlutterDeckSlideWidget {
  const CommandsSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/commands',
          title: 'Kommandon & Kontextvariabler',
          speakerNotes: '''
- /explain: Markera vilken kod som helst och kör /explain – perfekt för onboarding eller att förstå legacy-kod. Copilot förklarar logik, mönster och eventuella problem.
- /fix: Markera ett felmeddelande eller trasig kod. Copilot analyserar felet, förklarar orsaken och presenterar en konkret fix. Bra live-demo.
- /tests: Markera en klass eller metod. Copilot genererar kompletta enhetstester med edge cases. Sparar enormt med tid och höjer kodkvaliteten.
KONTEXTVARIABLER (steg 4) – det verkliga superkraften:
- #codebase: Semantisk sökning i hela repot. Fråga "hur fungerar autentisering?" utan att öppna en enda fil.
- #fetch <URL>: Hämta aktuell dokumentation direkt i chatten. Visa live: "#fetch https://learn.microsoft.com/dotnet/csharp/whats-new/csharp-13"
- #changes: Referera dina git-ändringar. Bra för att skapa commit-meddelanden eller code review.
- #problems: Referera alla fel i Problems-panelen. "Fixa alla fel i #problems" – kraftfullt i Agent-läge.
''',
          header: FlutterDeckHeaderConfiguration(
            title: 'Kommandon & Kontextvariabler',
          ),
          steps: 8,
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                    'Kommandon & Kontextvariabler',
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, end: 0, curve: Curves.easeOutQuad),
              const SizedBox(height: 32),
              Expanded(
                child: FlutterDeckSlideStepsBuilder(
                  builder: (context, stepNumber) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _CommandCard(
                                stepNumber: stepNumber,
                                targetStep: 1,
                                command: '/explain',
                                description:
                                    'Markera kod och få den förklarad — logik, mönster och potentiella problem. Perfekt för onboarding.',
                                icon: Icons.lightbulb,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _CommandCard(
                                stepNumber: stepNumber,
                                targetStep: 2,
                                command: '/fix',
                                description:
                                    'Markera felet eller koden. Copilot analyserar orsaken och presenterar en konkret fix med förklaring.',
                                icon: Icons.build,
                                color: Colors.redAccent,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _CommandCard(
                                stepNumber: stepNumber,
                                targetStep: 3,
                                command: '/tests',
                                description:
                                    'Generera kompletta enhetstester för markerad kod — inklusive edge cases du kanske glömt.',
                                icon: Icons.science,
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Align(
                          alignment: Alignment.centerLeft,
                          child:
                              const Text(
                                    '# Kontextvariabler — ge AI:n exakt rätt information',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white60,
                                      letterSpacing: 0.5,
                                    ),
                                  )
                                  .animate(target: stepNumber >= 4 ? 1.0 : 0.0)
                                  .fade(duration: 400.ms),
                        ),
                        const SizedBox(height: 14),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _ContextVar(
                                        stepNumber: stepNumber,
                                        targetStep: 5,
                                        name: '#codebase',
                                        description:
                                            'Semantisk sökning i hela repot — utan att öppna en enda fil.',
                                        color: const Color(0xFFCE93D8),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: _ContextVar(
                                        stepNumber: stepNumber,
                                        targetStep: 6,
                                        name: '#fetch <URL>',
                                        description:
                                            'Hämta aktuell dokumentation direkt i chatten. Aldrig mer föråldrad info.',
                                        color: Colors.tealAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 14),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _ContextVar(
                                        stepNumber: stepNumber,
                                        targetStep: 7,
                                        name: '#changes',
                                        description:
                                            'Referera dina git-ändringar. Skriv commit-meddelanden eller be om code review.',
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: _ContextVar(
                                        stepNumber: stepNumber,
                                        targetStep: 8,
                                        name: '#problems',
                                        description:
                                            'Referera alla fel i Problems-panelen. "Fixa #problems" i Agent-läge är kraftfullt.',
                                        color: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CommandCard extends StatelessWidget {
  const _CommandCard({
    required this.stepNumber,
    required this.targetStep,
    required this.command,
    required this.description,
    required this.icon,
    required this.color,
  });

  final int stepNumber;
  final int targetStep;
  final String command;
  final String description;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
          baseColor: color,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 32),
                  const SizedBox(width: 16),
                  Text(
                    command,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(fontSize: 20, color: Colors.white70),
              ),
            ],
          ),
        )
        .animate(target: stepNumber >= targetStep ? 1.0 : 0.0)
        .fade(duration: 600.ms)
        .scale(duration: 400.ms, curve: Curves.easeOutBack);
  }
}

class _ContextVar extends StatelessWidget {
  const _ContextVar({
    required this.stepNumber,
    required this.targetStep,
    required this.name,
    required this.description,
    required this.color,
  });

  final int stepNumber;
  final int targetStep;
  final String name;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(fontSize: 20, color: Colors.white70),
              ),
            ],
          ),
        )
        .animate(target: stepNumber >= targetStep ? 1.0 : 0.0)
        .fade(duration: 500.ms)
        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad);
  }
}
