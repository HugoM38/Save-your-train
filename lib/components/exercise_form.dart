import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseForm extends StatefulWidget {
  const ExerciseForm({super.key});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final restTimeController = TextEditingController();
  final executionTimeController = TextEditingController();
  final weightController = TextEditingController();
  final repetitionNumberController = TextEditingController();
  final seriesNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Padding(
        padding: EdgeInsets.only(left: 32.0, right: 32.0),
        child: Text(
          "Veuillez saisir les champs en rapport avec l'exercice :",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: TextField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Temps de repos",
            hintText: "Saisir le temps de repos",
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          controller: restTimeController,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: TextField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Temps d'exécution",
            hintText: "Saisir le temps d'exécution",
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          controller: executionTimeController,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Poids",
            hintText: "Saisir le poids",
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          controller: weightController,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            labelText: "Nombre de répétitions",
            hintText: "Saisir le nombre de répétitions",
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          controller: repetitionNumberController,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            labelText: "Nombre de séries",
            hintText: "Saisir le nombre de séries (facultatif)",
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          controller: seriesNumberController,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
            onPressed: () async {
              if (await isCaseExist(
                  restTimeController.text.isNotEmpty,
                  executionTimeController.text.isNotEmpty,
                  weightController.text.isNotEmpty,
                  repetitionNumberController.text.isNotEmpty)) {
                print("yes");
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.blue,
                    content: Center(child: Text("Ce cas d'exercice n'est pas possible")),
                  ));
                }
              }
            },
            child: const Text("Lancer l'exercice")),
      )
    ]);
  }

  Future<bool> isCaseExist(
      bool rest, bool execution, bool weight, bool repet) async {
    String response = await rootBundle.loadString('assets/exercise_cases.json');
    List<Map<String, dynamic>> exerciseCases =
        List<Map<String, dynamic>>.from(await json.decode(response));
    Map<String, bool> currentCase = {
      "exec": execution,
      "repet": repet,
      "rest": rest,
      "weight": weight
    };

    for (var exerciseCase in exerciseCases) {
      if (mapEquals(exerciseCase, currentCase)) return true;
    }

    return false;
  }
}
