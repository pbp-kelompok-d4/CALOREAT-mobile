import 'package:material_ui/material_ui.dart';
import 'package:caloreat_mobile/screens/auth.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final bool showProfileButton;

  AppBars({super.key, this.showProfileButton = true});

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

      actions: [
        if (showProfileButton)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AuthPage()),
                );
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFEFB60A),
                child: Icon(Icons.person, color: Color(0xFF2A2108), size: 24),
              ),
            ),
          ),
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
