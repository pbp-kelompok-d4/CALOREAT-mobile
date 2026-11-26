import 'package:caloreat_mobile/widgets/app_bar.dart';
import 'package:caloreat_mobile/widgets/bottom_navbar.dart';
import 'package:material_ui/material_ui.dart';

class CaloriePage extends StatelessWidget {
  const CaloriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: const Center(child: Text('Calorie Page')),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
