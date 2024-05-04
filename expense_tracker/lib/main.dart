import 'package:expense_tracker/core.dart';

var kLightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 14, 15, 126),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kLightColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kLightColorScheme.onPrimaryContainer,
          foregroundColor: kLightColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme(
          color: kLightColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kLightColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kLightColorScheme.onSecondaryContainer,
                fontSize: 20,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    ),
  );
}
