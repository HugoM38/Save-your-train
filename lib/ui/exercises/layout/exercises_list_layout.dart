import 'package:alfreed/alfreed.dart';
import 'package:flutter/material.dart';
import 'package:save_your_train/components/exercise_list.dart';
import 'package:save_your_train/ui/exercises/exercises_presenter.dart';
import 'package:save_your_train/ui/exercises/exercises_viewmodel.dart';
import 'package:save_your_train/ui/exercises/layout/add_exercises_layout.dart';

class ExercisesListLayout extends StatefulWidget {

  const ExercisesListLayout({super.key});

  @override
  State<ExercisesListLayout> createState() => _ExercisesListLayoutState();
}

class _ExercisesListLayoutState extends State<ExercisesListLayout> {
  @override
  Widget build(BuildContext context) {
    final model =
        PresenterInherited.dataOf<ExercisesPresenter, ExercisesViewModel>(
            context);
    return FutureBuilder(
        future: model.loadExercises(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == true) {
            return Scaffold(
                body: ExerciseListView(exercises: model.exercises),
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
                              child:  AddExerciseSheet(loadExercises: model.loadExercises),
                            );
                          });
                      await model.loadExercises();
                    },
                    child: const Icon(Icons.add)));
          } else {
            return const Text("Liste vide");
          }
        });
  }
}
