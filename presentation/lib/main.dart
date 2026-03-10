import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_deck_web_client/flutter_deck_web_client.dart';

import 'slides/challenges_slide.dart';
import 'slides/commands_slide.dart';
import 'slides/concepts_slide.dart';
import 'slides/gotchas_slide.dart';
import 'slides/intro_slide.dart';
import 'slides/modes_and_models_slide.dart';
import 'slides/prompt_patterns_slide.dart';
import 'slides/what_is_copilot_slide.dart';

void main() {
  runApp(const WorkshopPresentation());
}

class WorkshopPresentation extends StatelessWidget {
  const WorkshopPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      client: FlutterDeckWebClient(),
      themeMode: ThemeMode.dark,
      darkTheme: FlutterDeckThemeData.dark().copyWith(
        slideTheme: const FlutterDeckSlideThemeData(
          backgroundColor: Color(
            0xFF0B0F19,
          ), // Deep rich premium dark background
        ),
        headerTheme: const FlutterDeckHeaderThemeData(
          color: Color(0xFF64B5F6),
          textStyle: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: Color(0xFFF8FAFC), // Slate 50
            letterSpacing: 1.2,
          ),
        ),
        textTheme: const FlutterDeckTextTheme(
          title: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w800,
            color: Color(0xFFF8FAFC),
            letterSpacing: -0.5,
          ),
          subtitle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: Color(0xFF94A3B8), // Slate 400
          ),
          bodyMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xFFCBD5E1), // Slate 300
            height: 1.5,
          ),
        ),
      ),
      configuration: FlutterDeckConfiguration(
        footer: const FlutterDeckFooterConfiguration(
          showFooter: true,
          showSlideNumbers: true,
          showSocialHandle: false,
        ),
        transition: const FlutterDeckTransition.fade(),
        slideSize: FlutterDeckSlideSize.fromAspectRatio(
          aspectRatio: const FlutterDeckAspectRatio.ratio16x9(),
          resolution: const FlutterDeckResolution.fhd(),
        ),
      ),
      slides: const [
        IntroSlide(),
        WhatIsCopilotSlide(),
        ModesAndModelsSlide(),
        PromptPatternsSlide(),
        ConceptsSlide(),
        CommandsSlide(),
        GotchasSlide(),
        ChallengesSlide(),
      ],
    );
  }
}
