import 'package:flutter/material.dart';
import 'package:save_your_train/ui/exercises/exercises_model.dart';

class ExerciseListView extends StatefulWidget {
  const ExerciseListView({super.key, required this.exercises});
  final List<ExerciseModel> exercises;

  @override
  State<ExerciseListView> createState() => _ExerciseListViewState();
}

class _ExerciseListViewState extends State<ExerciseListView> {
  @override
  Widget build(BuildContext context) {
    if(widget.exercises.isEmpty) {
      return const Center(
        child: Text("Liste vide"),
      );
    }
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(widget.exercises[index].exerciseName,
                  style: const TextStyle(fontSize: 30)),
              subtitle: Text(widget.exercises[index].exerciseDescription),
            ),
          );
        },
        itemCount: widget.exercises.length,
      ),
    );
  }
}
