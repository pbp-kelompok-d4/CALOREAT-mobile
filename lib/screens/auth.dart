import 'package:caloreat_mobile/widgets/app_bar.dart';
import 'package:material_ui/material_ui.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(showProfileButton: false),
      body: const Center(child: Text('Auth Page')),
    );
  }
}
