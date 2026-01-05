import 'package:flutter/material.dart';

import 'package:day9_party/find_event.dart';

/// App entry point.
///
/// The preview/build was previously launching the default Flutter template
/// counter screen; this now launches the real UI demo screen (`FindEvent`)
/// by default.
// PUBLIC_INTERFACE
void main() {
  runApp(const MyApp());
}

/// Root widget for the application.
// PUBLIC_INTERFACE
class MyApp extends StatelessWidget {
  /// Creates the root app widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 9 Party',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // Default/home screen:
      home: const FindEvent(),

      // Minimal route map for future navigation, keeping FindEvent as default.
      routes: <String, WidgetBuilder>{
        '/find': (_) => const FindEvent(),
      },
    );
  }
}
