import 'package:material_ui/material_ui.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  AppBars({super.key});
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'caloreat',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 35,
          fontWeight: FontWeight.w900
        ),
      ),
    );
  }
}