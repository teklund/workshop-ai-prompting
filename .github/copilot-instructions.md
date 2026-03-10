# Project Guidelines

This is a Swedish-language workshop project for teaching GitHub Copilot usage. It contains a Flutter presentation app and supporting materials for a hands-on .NET CLI challenge.

## Architecture

- `presentation/` — Flutter slide deck app (the live demo).
- Root — Workshop README and challenge materials for participants.

## Language

- All user-facing text (slides, READMEs, UI strings) must be in **Swedish**.
- Code identifiers, comments, and commit messages should be in **English**.

## Flutter Presentation App (`presentation/`)

### Tech Stack

- **Flutter** with `flutter_deck` for slide structure and `flutter_animate` for animations.
- Dart 3.11+ with `flutter_lints` for analysis.

### Slide Conventions

- Each slide is a `FlutterDeckSlideWidget` subclass in `lib/slides/`.
- Use `FlutterDeckSlideStepsBuilder` for progressive step-based content reveals.
- Slides are registered in `main.dart` in presentation order.
- Use `FlutterDeckSlide.custom(builder:)` for full-control layouts.

### Design System

- **Dark theme only.** See `lib/slides/intro_slide.dart` and `lib/components/premium_card.dart` for canonical color and layout examples.
- `blank` slides use the global `slideTheme` background (`#0B0F19`). Use `LinearGradient` only for full-bleed `custom` slides (intro, challenges).
- Cards: `BorderRadius.circular(20)`, thin colored border with `alpha: 0.3`, subtle box shadow.
- Typography: bold white titles, `white70` body text.

### Animation Patterns

- Use `flutter_animate` extension methods (`.animate()`) — not raw `AnimationController`.
- **Step-driven reveal** (primary pattern): `.animate(target: stepNumber >= N ? 1.0 : 0.0).fade(duration: 600.ms).slideX(begin: 0.1, curve: Curves.easeOutQuad)`. Use a `double` target, not `int`.
- Continuous/looping animations: pass `onPlay: (c) => c.repeat(reverse: true)`.
- Typical durations: 400–800ms for transitions, 2s for ambient loops.
- Common effects: `fadeIn`, `slideX`/`slideY`, `scaleXY`, `moveY` (bobbing icons).
- Use `Curves.easeInOut` or `Curves.easeOutQuad`.

### Widget Patterns

- Reusable card widgets live in `lib/components/`.
- Prefer `const` constructors. Use `super.key` shorthand.
- Color transparency via `color.withValues(alpha: x)`.

## Build and Test

### Flutter Presentation

```bash
cd presentation
flutter run -d chrome   # or: -d macos, -d linux, -d windows
flutter test
```

### .NET Workshop Challenge

```bash
# One-time setup (participants run this themselves):
# dotnet new console -n ProjectZeroDay
cd ProjectZeroDay
dotnet run
```

## .NET Workshop Challenge

When generating code for the Zero-Touch Challenge:

- Target modern C# / .NET (latest LTS).
- All user-facing game text must be in **Swedish with a dark, gritty cyberpunk tone**.
- Use green terminal colors (`Console.ForegroundColor = ConsoleColor.Green`) and ASCII art.
- Use Records for domain models (`Server`, `Player`).

## Documentation Style

- READMEs are written in Swedish with emoji section headers.
- Use tables for schedules, shortcuts, and comparisons.
- Keep instructions concise and actionable for workshop participants.
