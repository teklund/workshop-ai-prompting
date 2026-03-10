import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../components/info_row.dart';

class GotchasSlide extends FlutterDeckSlideWidget {
  const GotchasSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/gotchas',
          title: 'Fallgropar',
          speakerNotes: '''
- Hallucinationer: Copilot kan hitta på metoder med stort självförtroende. Testa alltid output.
- Kontext-bubblan: AI:n ser bara det du visar den – inte hela det distribuerade systemet.
- Föråldrad info: Träningsdata har ett cutoff-datum. Nya ramverk och API:er kanske saknas.
- Granska ALLTID: Du är piloten och ansvarig för koden. Copilot är co-pilot.
''',
          header: FlutterDeckHeaderConfiguration(
            title: 'Verklighetens Fallgropar ⚠️',
          ),
          steps: 4,
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
                    'Lita inte blint på maskinen',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, end: 0, curve: Curves.easeOutQuad),
              const SizedBox(height: 40),
              Expanded(
                child: FlutterDeckSlideStepsBuilder(
                  builder: (context, stepNumber) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InfoRow(
                          stepNumber: stepNumber,
                          targetStep: 1,
                          title: 'Hallucinationer',
                          description:
                              'Copilot kan självsäkert hitta på metoder som låter rimliga men inte existerar.',
                          icon: Icons.psychology_alt,
                          color: const Color(0xFFCE93D8),
                        ),
                        const SizedBox(height: 16),
                        InfoRow(
                          stepNumber: stepNumber,
                          targetStep: 2,
                          title: 'Kontext-bubblan',
                          description:
                              'Att den ser en fil betyder inte att den förstår hela ditt distribuerade system.',
                          icon: Icons.bubble_chart,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 16),
                        InfoRow(
                          stepNumber: stepNumber,
                          targetStep: 3,
                          title: 'Föråldrad Information',
                          description:
                              'Modellen kanske inte känner till nya framework-funktioner från förra veckan.',
                          icon: Icons.history,
                          color: Colors.orangeAccent,
                        ),
                        const SizedBox(height: 16),
                        InfoRow(
                          stepNumber: stepNumber,
                          targetStep: 4,
                          title: 'Granska ALLTID (Review)',
                          description:
                              'Du är piloten. Copilot är... copilot. Läs alltid koden innan du committar.',
                          icon: Icons.visibility,
                          color: Colors.redAccent,
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
