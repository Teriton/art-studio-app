import 'package:art_studio_app/objects/workshop_api_repository.dart';
import 'package:art_studio_app/providers/auth_provider.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 181, 50, 40),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 114, 31, 25),
  brightness: .dark,
);

void main() async {
  runApp(ProviderScope(child: ArtStrudio()));
}

class ArtStrudio extends ConsumerWidget {
  const ArtStrudio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Art Studio',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        colorScheme: kColorScheme,
      ),

      home: ref
          .watch(authProvider)
          .when(
            data: (isAuth) => isAuth ? GeneralScreen() : WelcomeScreen(),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
