import 'package:material_ui/material_ui.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  AppBars({super.key});
  
  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: Transform.translate(
        offset: const Offset(0, 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/image/logo_caloreat.png',
              height: 60,
              width: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            Text(
              'caloreats',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}