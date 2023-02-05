import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:save_your_train/database/database.dart';
import 'package:save_your_train/main.dart';
import 'package:sqflite/sqflite.dart';

class AddExerciseSheet extends StatefulWidget {
  const AddExerciseSheet({super.key, required this.loadExercises});
  final Future<bool> Function() loadExercises;

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
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: "Nom de l'exercice", //babel text
              hintText: "Entrez le nom de l'exercice", //hint text
              //prefixIcon: Icon(Icons.fitness_center), //prefix iocn
              hintStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), //hint text style
              labelStyle:
                  TextStyle(fontSize: 15, color: Colors.blue), //label style
            ),
            controller: exerciseNameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: "Description", //babel text
              hintText: "Entrez la description de l'exercice", //hint text
              //prefixIcon: Icon(Icons.fitness_center), //prefix iocn
              hintStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), //hint text style
              labelStyle:
                  TextStyle(fontSize: 15, color: Colors.blue), //label style
            ),
            controller: exerciseDescriptionController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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

                await widget.loadExercises();

                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SaveYourTrain()),
                  );
                }
              },
              child: const Text("Créer l'exercice")),
        )
      ]),
    );
  }
}
