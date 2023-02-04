import 'package:alfreed/alfreed.dart';
import 'package:flutter/material.dart';
import 'package:save_your_train/ui/exercises/exercises.dart';
import 'package:save_your_train/ui/exercises/exercises_viewmodel.dart';

class ExercisesPresenter
    extends Presenter<ExercisesViewModel, ExercisesViewInterface> {
  ExercisesPresenter(BuildContext context)
      : super(state: ExercisesViewModel(context));

  @override
  void onInit() {
    super.onInit();

    loadExercises();
  }

  loadExercises() {
    state.exercises = [
      ExerciseModel(
          exerciseName: "Test",
          exerciseDescription: "description",
          executionTime: 30,
          numberRepetition: 12,
          restTime: 30,
          weight: 47.5,
          numberSeries: 4),
    ];
  }
}
