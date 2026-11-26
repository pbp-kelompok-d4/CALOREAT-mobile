import 'package:caloreat_mobile/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALOREAT',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFAE9),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEFB60A)),
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFF2A2108),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
