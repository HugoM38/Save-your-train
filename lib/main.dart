import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_your_train/components/tabs_menu.dart';
import 'package:save_your_train/ui/exercises/exercises.dart';

void main() {
  runApp(const SaveYourTrain());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

class SaveYourTrain extends StatelessWidget {
  const SaveYourTrain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
              bottomNavigationBar: const TabsMenu(), body: TabBarView(children: [
                ExercisesPage(),
              ]))),
    );
  }
}
