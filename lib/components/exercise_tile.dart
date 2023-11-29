import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String exerciseName;
  final String reps;
  final String sets;
  final String weight;

  const ExerciseTile({
    super.key,
    required this.exerciseName,
    required this.reps,
    required this.sets,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        // exercese name
        title: Text(exerciseName),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // weight
            Text('$weight Kg'),

            // reps
            Text('$reps reps'),

            // sets
            Text('$sets sets'),
          ],
        ),
      ),
    );
  }
}
