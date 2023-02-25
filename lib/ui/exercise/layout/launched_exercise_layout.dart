import 'package:flutter/material.dart';

class LaunchedExerciseSheet extends StatefulWidget {
  final int? execution;
  final int? rest;
  final int? repetition;
  final double? weight;
  final int series;

  const LaunchedExerciseSheet(
      {super.key,
      this.execution,
      this.rest,
      this.repetition,
      this.weight,
      required this.series});

  @override
  State<LaunchedExerciseSheet> createState() => _LaunchedExerciseSheetState();
}

class _LaunchedExerciseSheetState extends State<LaunchedExerciseSheet> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    List<Widget> childrens = [];
    if (widget.execution != null) {
      childrens.add(Text("Execution: ${widget.execution}"));
    }
    if (widget.repetition != null) {
      childrens.add(Text("Repetition: ${widget.repetition}"));
    }
    if (widget.rest != null) {
      childrens.add(Text("Repos: ${widget.rest}"));
    }
    if (widget.weight != null) {
      childrens.add(Text("Poids: ${widget.weight}"));
    }
    childrens.add(Text("Series: ${widget.series}"));

    return Column(children: childrens);
  }
}
