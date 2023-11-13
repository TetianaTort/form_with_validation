import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:form_with_validation/modules/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form with validation',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme().copyWith(
          titleLarge: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          titleMedium: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kColorScheme.onSecondary,
            ),
          ),
          bodySmall: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(134, 87, 123, 1),
);
