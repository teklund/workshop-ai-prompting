import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../components/info_row.dart';

class ConceptsSlide extends FlutterDeckSlideWidget {
  const ConceptsSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/concepts',
          title: 'Nyckelkoncept',
          speakerNotes: '''
- #file och #selection: Begränsa kontexten till exakt vad AI:n behöver se. Minskar brus.
- Iterativ Prompting: Första svaret är sällan perfekt. Fortsätt konversationen och förfina.
- Custom Instructions: Permanenta regler i .github/copilot-instructions.md – gäller alltid.
BONUS (visa om tid/intresse finns):
- MCP: Koppla Copilot till externa tjänster – databaser, Jira, GitHub, egna API:er.
- Prompt Files: Återanvändbara .prompt.md-filer versionshanterade i repot.
- Scoped Instructions: .instructions.md per mapp – olika regler för frontend/backend/tester.
- Skills: SKILL.md-filer paketerar domänkunskap som agenten kan läsa in – t.ex. projektkonventioner, API-mönster eller teststrategier.
''',
          header: FlutterDeckHeaderConfiguration(title: 'Nyckelkoncept'),
          steps: 7,
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(48.0),
          child: FlutterDeckSlideStepsBuilder(
            builder: (context, stepNumber) {
              final showBonus = stepNumber >= 4;
              final cardSpacing = showBonus ? 10.0 : 22.0;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InfoRow(
                    stepNumber: stepNumber,
                    targetStep: 1,
                    icon: Icons.anchor,
                    title: '1. Kontext-ankring (#)',
                    description: '#file och #selection för precis kontext.',
                    color: Colors.blueAccent,
                  ),
                  SizedBox(height: cardSpacing),
                  InfoRow(
                    stepNumber: stepNumber,
                    targetStep: 2,
                    icon: Icons.forum,
                    title: '2. Iterativ Prompting',
                    description: 'Håll konversationen vid liv och förfina.',
                    color: const Color(0xFFCE93D8),
                  ),
                  SizedBox(height: cardSpacing),
                  InfoRow(
                    stepNumber: stepNumber,
                    targetStep: 3,
                    icon: Icons.rule,
                    title: '3. Custom Instructions',
                    description:
                        'Lär Copilot ditt team — språk, arkitektur och regler, en gång för alla.',
                    color: Colors.greenAccent,
                  ),
                  if (showBonus) ...[
                    const SizedBox(height: 14),
                    const Text(
                      'Vill du mer? 🚀',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white60,
                        letterSpacing: 1.0,
                      ),
                    ).animate().fadeIn(duration: 400.ms),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _BonusChip(
                            icon: Icons.hub_outlined,
                            title: 'MCP',
                            description:
                                'Koppla Copilot till externa tjänster — databaser, Jira, GitHub.',
                            visible: stepNumber >= 4,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _BonusChip(
                            icon: Icons.description_outlined,
                            title: 'Prompt Files',
                            description:
                                'Återanvändbara .prompt.md versionshanterade i repot.',
                            visible: stepNumber >= 5,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _BonusChip(
                            icon: Icons.folder_special_outlined,
                            title: 'Scoped Instructions',
                            description:
                                '.instructions.md per mapp — olika regler för olika delar av repot.',
                            visible: stepNumber >= 6,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _BonusChip(
                            icon: Icons.psychology_outlined,
                            title: 'Skills',
                            description:
                                'Öppen standard för AI-förmågor. Inte bara text — kod, scripts och resurser. Fungerar i alla Copilot-verktyg. Framtiden.',
                            visible: stepNumber >= 7,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _BonusChip extends StatelessWidget {
  const _BonusChip({
    required this.icon,
    required this.title,
    required this.description,
    required this.visible,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white60, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 15, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
