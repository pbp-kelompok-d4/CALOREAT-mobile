import 'package:caloreat_mobile/widgets/app_bar.dart';
import 'package:material_ui/material_ui.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: const Center(
        child: Text('CALOREAT TEST'),
      ),
    );
  }
}