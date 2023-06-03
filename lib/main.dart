import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 249, 194, 13),
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.primaryContainer.withOpacity(0.2),
    foregroundColor: kColorScheme.onPrimaryContainer,
    elevation: 8,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

final themeDark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 249, 194, 13),
  ),
  // appBarTheme: const AppBarTheme().copyWith(
  //   backgroundColor: kColorScheme.onBackground.withOpacity(0.5),
  //   foregroundColor: kColorScheme.primaryContainer,
  //   elevation: 8,
  // ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isDarkMode = false;

  void _toggleMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? themeDark : theme,
      home: TabsScreen(mode: isDarkMode, toggleMode: _toggleMode),
    );
  }
}
