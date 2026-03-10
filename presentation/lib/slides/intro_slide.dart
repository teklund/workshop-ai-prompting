import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroSlide extends FlutterDeckSlideWidget {
  const IntroSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/intro',
          title: 'Välkommen',
          speakerNotes: '''
- Välkomna! Presentera dig själv och kvällens agenda.
- Setup-check: VS Code, Copilot-extension och aktiv licens redo?
- Agenda: demo (30 min) → Zero-Touch Workshop (75 min) → Show & Tell + prisutdelning.
''',
          header: FlutterDeckHeaderConfiguration(
            title: 'Välkommen',
            showHeader: false,
          ),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Stack(
          fit: StackFit.expand,
          children: [
            if (kIsWeb)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.5, -1.0),
                    end: Alignment(0.5, 1.0),
                    colors: [
                      Color(0xFF1E1E2C),
                      Color(0xFF2A2D43),
                      Color(0xFF4A4E69),
                    ],
                  ),
                ),
                child: SizedBox.expand(),
              )
            else
              const SizedBox.expand()
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .custom(
                    duration: 5.seconds,
                    builder: (context, value, child) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-1.0 + (2.0 * value), -1.0),
                            end: Alignment(1.0 - (2.0 * value), 1.0),
                            colors: const [
                              Color(0xFF1E1E2C),
                              Color(0xFF2A2D43),
                              Color(0xFF4A4E69),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                        Icons.auto_awesome,
                        size: 120,
                        color: Colors.orangeAccent,
                      )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .scaleXY(
                        begin: 1.0,
                        end: 1.2,
                        duration: 2.seconds,
                        curve: Curves.easeInOut,
                      )
                      .custom(
                        duration: 2.seconds,
                        builder: (context, value, child) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orangeAccent.withValues(
                                    alpha: 0.5 * value,
                                  ),
                                  blurRadius: 30 * value,
                                ),
                              ],
                            ),
                            child: child,
                          );
                        },
                      ),
                  const SizedBox(height: 40),
                  const Text(
                        'AI-kodkväll',
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 1500.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 1500.ms,
                        curve: Curves.easeOutCubic,
                      ),
                  const SizedBox(height: 20),
                  const Text(
                        'Från Gissningar till Pricksäkerhet med GitHub Copilot',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: Colors.white70,
                        ),
                      )
                      .animate()
                      .fadeIn(delay: 500.ms, duration: 1500.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 1500.ms,
                        curve: Curves.easeOutCubic,
                      ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
