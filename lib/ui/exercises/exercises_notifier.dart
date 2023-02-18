import 'package:save_your_train/database/database.dart';
import 'package:save_your_train/ui/exercises/exercises_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExercisesNotifier extends StateNotifier<List<ExerciseModel>> {
  ExercisesNotifier() : super(const <ExerciseModel>[]);

  void addExercise(ExerciseModel exercise) {
    state = [
      ...state,
      exercise,
    ];
  }

  void setExercises(List<ExerciseModel> exercises) {
    state = exercises;
  }

  Future<void> loadExercisesFromDatabase() async {
    Database db = await DATABASE.instance.database;

    List<Map<String, dynamic>> result = await db.query("exercises");

    state = List.generate(result.length, (i) {
      return ExerciseModel(
        exerciseName: result[i]['exerciseName'],
        exerciseDescription: result[i]['exerciseDescription'],
      );
    });
  }
}

final StateNotifierProvider<ExercisesNotifier, List<ExerciseModel>> exercisesProvider =
    StateNotifierProvider((ref) => ExercisesNotifier());
