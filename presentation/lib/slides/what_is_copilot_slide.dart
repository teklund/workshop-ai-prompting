import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../components/info_row.dart';

class WhatIsCopilotSlide extends FlutterDeckSlideWidget {
  const WhatIsCopilotSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/what-is-copilot',
          title: 'Vad är GitHub Copilot?',
          speakerNotes: '''
- Copilot är långt mer än ett autocomplete-verktyg.
- Det är en AI-parprogrammerare som kan förklara, refaktorera och generera hel kod.
- Bygger på kraftfulla modeller – vi kör Claude Sonnet 4.6 ikväll.
- Kontextmedveten: ser dina öppna filer och förstår strukturen i ditt repo.
''',
          header: FlutterDeckHeaderConfiguration(
            title: 'Vad är GitHub Copilot?',
          ),
          steps: 3,
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
                    'Mer än bara "autocomplete"',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, end: 0, curve: Curves.easeOutQuad),
              const SizedBox(height: 60),
              Expanded(
                child: FlutterDeckSlideStepsBuilder(
                  builder: (context, stepNumber) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoRow(
                          stepNumber: stepNumber,
                          targetStep: 1,
                          icon: Icons.people,
                          title: 'Din AI-Parprogrammerare',
                          description:
                              'Sitter bredvid dig, ger förslag, förklarar kod och hjälper till att refaktorera i realtid.',
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 20),
                        InfoRow(
                          stepNumber: stepNumber,
                          targetStep: 2,
                          icon: Icons.hub,
                          title: 'Bygger på avancerade modeller',
                          description:
                              'Använder kraftfulla modeller (som Claude Sonnet 4.6) tränade på enorma mängder publik kod.',
                          color: Colors.tealAccent,
                        ),
                        const SizedBox(height: 20),
                        InfoRow(
                          stepNumber: stepNumber,
                          targetStep: 3,
                          icon: Icons.visibility,
                          title: 'Kontext-medveten',
                          description:
                              'Den läser vad du har öppet i editorn och förstår strukturen i ditt repository för att ge relevanta svar.',
                          color: const Color(0xFFCE93D8),
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
