import 'package:alfreed/alfreed.dart';
import 'package:flutter/material.dart';
import 'package:save_your_train/ui/exercises/exercises_presenter.dart';
import 'package:save_your_train/ui/exercises/exercises_viewmodel.dart';
import 'package:save_your_train/ui/exercises/layout/exercises_list_layout.dart';

class ExercisesViewInterface extends AlfreedView {
  ExercisesViewInterface(BuildContext context) : super(context: context);

  
}

class ExercisesPage extends AlfreedPage<ExercisesPresenter, ExercisesViewModel,
    ExercisesViewInterface> {
  ExercisesPage({
    String? args,
    Key? key,
  }) : super(args: args, key: key);

  @override
  AlfreedPageBuilder<ExercisesPresenter, ExercisesViewModel,
      ExercisesViewInterface> build() {
    return AlfreedPageBuilder<ExercisesPresenter, ExercisesViewModel,
        ExercisesViewInterface>(
      key: const ValueKey('ExercisesPagePresenter'),
      presenterBuilder: (context) => ExercisesPresenter(context),
      interfaceBuilder: (context) => ExercisesViewInterface(context),
      builder: (context, presenter, model) {
        return Material(
          child: ExercisesListLayout(exercises: model.exercises),
        );
      },
    );
  }
}
