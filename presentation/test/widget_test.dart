import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:presentation/main.dart';

void main() {
  testWidgets('Presentation smoke test', (WidgetTester tester) async {
    // Set surface size to avoid overflows (16:9 presentation ratio)
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(const WorkshopPresentation());

    // We can't use pumpAndSettle because of continuous animations.
    // Pump a few frames to let initial animations start.
    await tester.pump(const Duration(milliseconds: 500));

    // Verify that the title of our first slide appears.
    expect(find.text('AI-kodkväll'), findsOneWidget);

    // Reset surface size
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
