import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../components/premium_card.dart';

class PromptPatternsSlide extends FlutterDeckSlideWidget {
  const PromptPatternsSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/prompt-patterns',
          title: 'Prompt-Mönster',
          speakerNotes: '''
- Role Prompting: Ge AI:n en professionell roll och bakgrund. Höjer kvalitet direkt.
- Chain of Thought: Be AI:n tänka i numrerade steg innan den kodar. Minskar hallucinationer.
- Zero-Shot → Few-Shot: Visa konkreta in/ut-exempel. AI:n lär sig snabbt av mönster.
''',
          header: FlutterDeckHeaderConfiguration(
            title: 'Prompt-Mönster: Så gör proffsen',
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
                    'De Tre Gyllene Mönstren',
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
                    return Row(
                      children: [
                        Expanded(
                          child: _PatternCard(
                            stepNumber: stepNumber,
                            targetStep: 1,
                            title: 'Role Prompting (Ge en roll)',
                            badPrompt: 'Fixa den här koden.',
                            goodPrompt:
                                'Du är en senior C#/.NET-utvecklare. Refaktorera denna klass så att den följer SOLID-principerna, använder dependency injection och är optimerad för ASP.NET Core.',
                            color: Colors.cyanAccent,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: _PatternCard(
                            stepNumber: stepNumber,
                            targetStep: 2,
                            title: 'Chain of Thought (Steg för steg)',
                            badPrompt: 'Bygg en order-hantering.',
                            goodPrompt:
                                'Jag behöver en order-pipeline i C#. Tänk steg för steg:\n1. Validera ordern med FluentValidation\n2. Kontrollera lagersaldo via IInventoryService\n3. Beräkna pris inkl. moms och rabatter\n4. Spara via EF Core i en transaktion\n5. Publicera ett OrderCreated-event via MediatR',
                            color: Colors.pinkAccent,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: _PatternCard(
                            stepNumber: stepNumber,
                            targetStep: 3,
                            title: 'Zero-Shot → Few-Shot',
                            badPrompt: 'Formatera kundnamn åt mig.',
                            goodPrompt:
                                'Skriv en C#-metod som formaterar kundnamn.\nInput: "john DOE" → "Doe, John"\nInput: "ANNA svensson" → "Svensson, Anna"\nGör nu samma för alla namn i en List<string>.',
                            color: Colors.orangeAccent,
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

class _PatternCard extends StatelessWidget {
  const _PatternCard({
    required this.stepNumber,
    required this.targetStep,
    required this.title,
    required this.badPrompt,
    required this.goodPrompt,
    required this.color,
  });

  final int stepNumber;
  final int targetStep;
  final String title;
  final String badPrompt;
  final String goodPrompt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
          baseColor: color,
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.auto_awesome, color: color, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                '❌ Undvik:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.redAccent.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  badPrompt,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '✅ Prova istället:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.greenAccent.withValues(alpha: 0.3),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      goodPrompt,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        .animate(target: stepNumber >= targetStep ? 1.0 : 0.0)
        .fade(duration: 600.ms)
        .slideX(begin: -0.2, curve: Curves.easeOutQuad);
  }
}
