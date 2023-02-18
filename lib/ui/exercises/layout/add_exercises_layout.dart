import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:save_your_train/database/database.dart';
import 'package:save_your_train/ui/exercises/exercises_notifier.dart';
import 'package:save_your_train/ui/exercises/exercises_model.dart';
import 'package:sqflite/sqflite.dart';

class AddExerciseSheet extends StatefulWidget {
  const AddExerciseSheet({super.key, required this.exercisesNotifier});
  final ExercisesNotifier exercisesNotifier;

  @override
  State<AddExerciseSheet> createState() => _AddExerciseSheetState();
}

class _AddExerciseSheetState extends State<AddExerciseSheet> {
  final exerciseNameController = TextEditingController();
  final exerciseDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer un exercice"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: "Nom de l'exercice",
              hintText: "Entrez le nom de l'exercice",
              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
            ),
            controller: exerciseNameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: "Description",
              hintText: "Entrez la description de l'exercice",
              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
            ),
            controller: exerciseDescriptionController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: ElevatedButton(
              onPressed: () async {
                if (exerciseNameController.text.isEmpty) return;

                Database db = await DATABASE.instance.database;

                if ((await db.query('exercises',
                        where: 'exerciseName = ?',
                        whereArgs: [exerciseNameController.text]))
                    .isNotEmpty) {
                  Fluttertoast.showToast(
                      msg: "Il existe déjà un exercice à ce nom");
                  return;
                }

                await db.insert("exercises", {
                  'exerciseName': exerciseNameController.text,
                  'exerciseDescription': exerciseDescriptionController.text
                });

                if (context.mounted) {
                  widget.exercisesNotifier
                      .addExercise(ExerciseModel(
                          exerciseName: exerciseNameController.text,
                          exerciseDescription:
                              exerciseDescriptionController.text));

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const SaveYourTrain(),
                  //   ),
                  // );

                  Navigator.pop(context);
                }
              },
              child: const Text("Créer l'exercice")),
        )
      ]),
    );
  }
}
