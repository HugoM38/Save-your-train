import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:save_your_train/ui/exercises/exercises_model.dart';
import 'package:save_your_train/ui/exercises/exercises_notifier.dart';
import 'package:save_your_train/ui/exercises/layout/exercises_list_layout.dart';

class ExercisesPage extends ConsumerWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ExerciseModel> exercises = ref.watch(exercisesProvider);
    final ExercisesNotifier exercisesNotifier =
        ref.watch(exercisesProvider.notifier);
    if (exercises.isEmpty) {
      exercisesNotifier.loadExercisesFromDatabase();
      print("test");
    }
    return ExercisesListLayout(
        exercisesNotifier: exercisesNotifier, exercises: exercises);
  }
}
