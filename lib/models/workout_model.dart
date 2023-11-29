import 'package:my_card/models/exercise_model.dart';

class Workout {
  final String workoutName;
  List<Exercise> exercise;

  Workout({
    required this.exercise,
    required this.workoutName,
  });
}
