import 'package:caloreat_mobile/widgets/app_bar.dart';
import 'package:caloreat_mobile/widgets/bottom_navbar.dart';
import 'package:material_ui/material_ui.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: const Center(
        child: Text('Reviews Page'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }
}
