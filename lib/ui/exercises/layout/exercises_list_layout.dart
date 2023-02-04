import 'package:flutter/material.dart';
import 'package:save_your_train/components/exercise_list.dart';
import 'package:save_your_train/ui/exercises/exercises_viewmodel.dart';

class ExercisesListLayout extends StatefulWidget {
  final List<ExerciseModel> exercises;

  const ExercisesListLayout({super.key, required this.exercises});

  @override
  State<ExercisesListLayout> createState() => _ExercisesListLayoutState();
}

class _ExercisesListLayoutState extends State<ExercisesListLayout> {
  @override
  Widget build(BuildContext context) {

    return ExerciseListView(exercises: widget.exercises);
  }
}