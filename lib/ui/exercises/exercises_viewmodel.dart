import 'package:flutter/material.dart';

class ExercisesViewModel {
  BuildContext context;
  List<ExerciseModel> exercises;

  ExercisesViewModel(this.context): exercises = [];
}

class ExerciseModel {
  final String exerciseName;
  final String exerciseDescription;
  final int executionTime;
  final int numberRepetition;
  final int restTime;
  final double weight;
  final int numberSeries;

  ExerciseModel(
      {required this.exerciseName,
      required this.exerciseDescription,
      required this.executionTime,
      required this.numberRepetition,
      required this.restTime,
      required this.weight,
      required this.numberSeries});
}
