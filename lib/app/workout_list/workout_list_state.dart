part of 'workout_list_bloc.dart';

@immutable
sealed class WorkoutListState {
  final List workoutList;

  const WorkoutListState({
    required this.workoutList,
  });
}

class WorkoutListInitial extends WorkoutListState {
  const WorkoutListInitial({
    required super.workoutList,
  });
}

class WorkoutListLoading extends WorkoutListState {
  const WorkoutListLoading({
    required super.workoutList,
  });
}

class WorkoutListLoaded extends WorkoutListState {
  const WorkoutListLoaded({
    required super.workoutList,
  });
}

class WorkoutListError extends WorkoutListState {
  const WorkoutListError({
    required super.workoutList,
  });
}
