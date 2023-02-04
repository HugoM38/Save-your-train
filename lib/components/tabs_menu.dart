import 'package:flutter/material.dart';

class TabsMenu extends StatelessWidget {
  const TabsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF3F5AA6),
        child: const TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.blue,
          tabs: [
            Tab(
              text: "Exercices",
              icon: Icon(Icons.fitness_center),
            ),
            Tab(
              text: "Historiques",
              icon: Icon(Icons.timer),
            ),
          ],
        ));
  }
}
