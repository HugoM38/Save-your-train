import 'package:alfreed/alfreed.dart';
import 'package:flutter/material.dart';
import 'package:save_your_train/ui/exercises/exercises.dart';
import 'package:save_your_train/ui/exercises/exercises_viewmodel.dart';
import 'package:save_your_train/ui/exercises/layout/add_exercises_layout.dart';

class ExercisesPresenter
    extends Presenter<ExercisesViewModel, ExercisesViewInterface> {
  ExercisesPresenter(BuildContext context)
      : super(state: ExercisesViewModel(context));


}
