import 'package:flutter/material.dart';
import 'package:save_your_train/components/exercise_list.dart';
import 'package:save_your_train/ui/exercises/exercises_model.dart';
import 'package:save_your_train/ui/exercises/exercises_notifier.dart';
import 'package:save_your_train/ui/exercises/layout/add_exercises_layout.dart';

class ExercisesListLayout extends StatefulWidget {
  const ExercisesListLayout({super.key, required this.exercisesNotifier, required this.exercises});
  final ExercisesNotifier exercisesNotifier;
  final List<ExerciseModel> exercises;

  @override
  State<ExercisesListLayout> createState() => _ExercisesListLayoutState();
}

class _ExercisesListLayoutState extends State<ExercisesListLayout> {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context) => Scaffold(
            body: ExerciseListView(exercises: widget.exercises),
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  showModalBottomSheet<void>(
                      context: context,
                      isDismissible: false,
                      enableDrag: false,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: AddExerciseSheet(
                              exercisesNotifier: widget.exercisesNotifier),
                        );
                      });
                },
                child: const Icon(Icons.add))));
  }
}
