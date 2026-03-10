import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../components/mode_card.dart';
import '../components/model_chip.dart';

class ModesAndModelsSlide extends FlutterDeckSlideWidget {
  const ModesAndModelsSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/modes-and-models',
          title: 'Lägen & Modeller',
          speakerNotes: '''
- Ask: Fråga och lär – ändrar ingenting i koden.
- Plan: Copilot lägger en plan du godkänner innan koden skrivs. Bra för komplexa uppgifter.
- Agent: Kör terminalen, skapar filer och itererar självständigt. Kraftfullt – granska alltid!
- Rekommenderad modell ikväll: Claude Sonnet 4.6 – balanserad för kod och agentuppgifter.
- GPT-5.3-Codex: Specialbyggd för agentkodning – features, tester, refaktorering utan långa instruktioner.
- Opus 4.6: Anthropics kraftfullaste – sofistikerat resonemang för komplexa problem.
- Budgetmodeller: GPT-5 mini är GRATIS (0x). Haiku 4.5 kostar 0.33x. Bra för enkla frågor – men hallucineringar ökar och kontextförståelse minskar.
''',
          header: FlutterDeckHeaderConfiguration(
            title: 'Lägen & Modeller i Copilot',
          ),
          steps: 6,
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(64.0),
          child: FlutterDeckSlideStepsBuilder(
            builder: (context, stepNumber) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // --- MODES SECTION ---
                  const Text(
                        'Tre lägen i chatten',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: -0.2, end: 0),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ModeCard(
                          stepNumber: stepNumber,
                          targetStep: 1,
                          icon: Icons.chat_bubble_outline,
                          title: 'Ask',
                          subtitle: 'Fråga & Lär',
                          description:
                              'Ställ frågor om kod, arkitektur eller koncept. Ändrar ingenting.',
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ModeCard(
                          stepNumber: stepNumber,
                          targetStep: 2,
                          icon: Icons.map_outlined,
                          title: 'Plan',
                          subtitle: 'Planera innan du bygger',
                          description:
                              'Copilot analyserar uppgiften och skapar en steg-för-steg-plan du godkänner innan koden skrivs.',
                          color: Colors.amberAccent,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ModeCard(
                          stepNumber: stepNumber,
                          targetStep: 3,
                          icon: Icons.smart_toy,
                          title: 'Agent',
                          subtitle: 'Autonom kodning',
                          description:
                              'Copilot kör själv: skapar filer, kör terminalen och itererar tills det funkar.',
                          color: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // --- MODELS SECTION ---
                  _ModelsSection(stepNumber: stepNumber),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _ModelsSection extends StatelessWidget {
  const _ModelsSection({required this.stepNumber});

  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Välj rätt modell',
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).animate(target: stepNumber >= 4 ? 1.0 : 0.0).fade(duration: 500.ms),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ModelChip(
                name: 'Claude Sonnet 4.6',
                detail: '★ Rekommenderad – Kod & agentuppgifter',
                color: const Color(0xFFE8985E),
                isRecommended: true,
                stepNumber: stepNumber,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ModelChip(
                name: 'GPT-5.3-Codex',
                detail: 'Agentkodning – komplex ingenjörskonst',
                color: Colors.white60,
                isRecommended: false,
                stepNumber: stepNumber,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ModelChip(
                name: 'Gemini 2.5 Pro',
                detail: 'Komplex kodgenerering & research',
                color: Colors.white60,
                isRecommended: false,
                stepNumber: stepNumber,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ModelChip(
                name: 'Claude Opus 4.6',
                detail: 'Kraftfullast – sofistikerat resonemang',
                color: Colors.white60,
                isRecommended: false,
                stepNumber: stepNumber,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          '💡 Spara tokens: GPT-5 mini (gratis) eller Claude Haiku 4.5 (0.33x) för enkla frågor – men räkna med fler hallucinationer.',
          style: TextStyle(
            fontSize: 17,
            color: Colors.orangeAccent,
            fontStyle: FontStyle.italic,
          ),
        ).animate(target: stepNumber >= 6 ? 1.0 : 0.0).fade(duration: 400.ms),
      ],
    );
  }
}
