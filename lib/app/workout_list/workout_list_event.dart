part of 'workout_list_bloc.dart';

@immutable
sealed class WorkoutListEvent {}

// workout proccess
class AddWorkoutToList extends WorkoutListEvent {
  final Workout workout;

  AddWorkoutToList({
    required this.workout,
  });
}

// exercies proccess
class AddExerciesToList extends WorkoutListEvent {
  final Exercise exercise;
  final String workoutName;

  AddExerciesToList({
    required this.workoutName,
    required this.exercise,
  });
}
