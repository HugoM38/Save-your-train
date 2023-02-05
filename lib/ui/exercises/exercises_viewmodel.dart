import 'package:flutter/material.dart';
import 'package:save_your_train/database/database.dart';
import 'package:sqflite/sqflite.dart';

class ExercisesViewModel extends ChangeNotifier {
  BuildContext context;
  List<ExerciseModel> exercises;

  ExercisesViewModel(this.context): exercises = [] ;

  Future<bool> loadExercises() async {
    Database db = await DATABASE.instance.database;

    List<Map<String, dynamic>> result = await db.query("exercises");

    exercises = List.generate(result.length, (i) {
      return ExerciseModel(
        exerciseName: result[i]['exerciseName'],
        exerciseDescription: result[i]['exerciseDescription'],
      );
    });

    return true;
  }
}

class ExerciseModel {
  final String exerciseName;
  final String exerciseDescription;

  ExerciseModel({
    required this.exerciseName,
    required this.exerciseDescription,
  });
}
