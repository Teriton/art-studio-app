import 'package:art_studio_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 181, 50, 40),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 114, 31, 25),
  brightness: .dark,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Art Studio',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        colorScheme: kColorScheme,
      ),

      home: WelcomeScreen(),
    );
  }
}
