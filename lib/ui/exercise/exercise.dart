import 'package:flutter/material.dart';
import 'package:save_your_train/components/exercise_form.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key, required this.exerciseName});
  final String exerciseName;

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.exerciseName),
      ),
      body: const ExerciseForm(),
    );
  }
}