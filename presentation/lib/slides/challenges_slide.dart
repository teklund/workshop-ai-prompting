import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../components/info_row.dart';

class ChallengesSlide extends FlutterDeckSlideWidget {
  const ChallengesSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/challenges',
          title: 'Zero-Touch Challenge',
          speakerNotes: '''
- Dags för Zero-Touch Challenge! Ramverk och tema är fritt.
- README:n har två förberedda spår: Project Zero-Day (.NET CLI) och NetCrack (HTML/JS clicker) — men det är bara exempel.
- Ingen manuell kod — allt genereras av Copilot. Går det fel? Prompta fram en fix.
- Manuell drift OK: skapa filer, döp om dem, kör terminalen.
- Solo eller i grupp — helt valfritt.
- Deadline 20:00 — Show & Tell då.
- Länk: ai-workshop.teklund.dev — allt kring workshopen och presentationen finns där.
''',
          header: FlutterDeckHeaderConfiguration(
            title: 'Zero-Touch Challenge',
            showHeader: false,
          ),
          steps: 6,
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF0A0E17), Color(0xFF1A2332)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                      '🚫⌨️ Zero-Touch Challenge',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00FF41),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: -0.5, end: 0, curve: Curves.easeOutBack),
                const SizedBox(height: 50),
                Expanded(
                  child: FlutterDeckSlideStepsBuilder(
                    builder: (context, stepNumber) {
                      return Column(
                        children: [
                          Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28,
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF00FF41,
                                  ).withValues(alpha: 0.07),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(
                                      0xFF00FF41,
                                    ).withValues(alpha: 0.3),
                                  ),
                                ),
                                child: const Text(
                                  '🎯 Uppdraget: Bygg något med Copilot — ramverk och tema är helt fritt. README:n har två förberedda spår: Project Zero-Day (.NET CLI) och NetCrack (HTML/JS) — men välj fritt!',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFF00FF41),
                                    height: 1.5,
                                  ),
                                ),
                              )
                              .animate(target: stepNumber >= 1 ? 1.0 : 0.0)
                              .fade(duration: 600.ms)
                              .slideY(
                                begin: 0.1,
                                end: 0,
                                curve: Curves.easeOutQuad,
                              ),
                          const SizedBox(height: 20),
                          InfoRow(
                            stepNumber: stepNumber,
                            targetStep: 2,
                            icon: Icons.group,
                            title: 'Team eller solo — ditt val',
                            description:
                                'Valfritt — har du bästa idén eller vill du slå dig ihop med en kollega?',

                            color: const Color(0xFFCE93D8),
                          ),
                          const SizedBox(height: 16),
                          InfoRow(
                            stepNumber: stepNumber,
                            targetStep: 3,
                            icon: Icons.block,
                            title: 'Zero-Touch-regeln',
                            description:
                                'Ingen manuell kod — allt genereras av Copilot. Går det fel? Prompta fram en fix.',
                            color: const Color(0xFFFF4444),
                          ),
                          const SizedBox(height: 16),
                          InfoRow(
                            stepNumber: stepNumber,
                            targetStep: 4,
                            icon: Icons.terminal,
                            title: 'Manuell drift OK',
                            description:
                                'Du får skapa filer och köra terminalen — men AI:n skriver koden.',
                            color: const Color(0xFF00B4D8),
                          ),
                          const SizedBox(height: 16),
                          InfoRow(
                            stepNumber: stepNumber,
                            targetStep: 5,
                            icon: Icons.timer,
                            title: '⏰ Deadline: kl 20:00',
                            description:
                                'Show & Tell startar 20:00 — då visar alla upp vad de byggt. Se till att ha något att visa!',
                            color: Colors.orangeAccent,
                          ),
                          const SizedBox(height: 24),
                          const Column(
                                children: [
                                  Text(
                                    '🔗 ai-workshop.teklund.dev',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF64B5F6),
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    'Regler, presentation och allt du behöver — samlat på ett ställe.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              )
                              .animate(target: stepNumber >= 6 ? 1.0 : 0.0)
                              .fade(duration: 600.ms),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
