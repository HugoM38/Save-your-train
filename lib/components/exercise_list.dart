import 'package:flutter/material.dart';
import 'package:save_your_train/ui/exercises/exercises_viewmodel.dart';

class ExerciseListView extends StatelessWidget {
  final List<ExerciseModel> exercises;

  const ExerciseListView({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    if(exercises.isEmpty) {
      return const Center(
        child: Text("Liste vide"),
      );
    }
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(exercises[index].exerciseName,
                  style: const TextStyle(fontSize: 30)),
              subtitle: Text(exercises[index].exerciseDescription),
            ),
          );
        },
        itemCount: exercises.length,
      ),
    );
  }
}
