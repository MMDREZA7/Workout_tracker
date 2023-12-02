import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/exercise_model.dart';
import '../../models/workout_model.dart';

part 'workout_list_event.dart';
part 'workout_list_state.dart';

List<Workout> workoutList = [
  Workout(
    exercise: [
      Exercise(
        exerciseName: 'dambel',
        reps: '10',
        sets: '3',
        weight: '10',
      ),
      Exercise(
        exerciseName: '2',
        reps: '10',
        sets: '3',
        weight: '0',
      ),
    ],
    workoutName: 'Upper Body',
  ),
  Workout(
    exercise: [
      Exercise(
        exerciseName: 'Squat',
        reps: '15',
        sets: '4',
        weight: '12',
      ),
      Exercise(
        exerciseName: 's',
        reps: '5',
        sets: '4',
        weight: '6',
      ),
    ],
    workoutName: 'Lower Body',
  ),
  Workout(
    exercise: [
      Exercise(
        exerciseName: 'Head by ball',
        reps: '10',
        sets: '3',
        weight: '2',
      ),
    ],
    workoutName: 'Header Body',
  ),
];

class WorkoutListBloc extends Bloc<WorkoutListEvent, WorkoutListState> {
  WorkoutListBloc() : super(WorkoutListInitial(workoutList: workoutList)) {
    // add workout proccos
    on<AddWorkoutToList>((event, emit) {
      emit(WorkoutListLoading(workoutList: workoutList));

      workoutList.add(event.workout);

      emit(WorkoutListLoaded(workoutList: workoutList));
    });

    // add execise proccos
    on<AddExerciesToList>((event, emit) {
      emit(WorkoutListLoading(workoutList: workoutList));

      // create an index for find element ( exersice of workout class  )
      final workoutIndex = workoutList.indexOf(
        workoutList.firstWhere(
          (element) => element.workoutName == event.workoutName,
        ),
      );

      if (workoutIndex < 0) {
        emit(
          const WorkoutListError(
            workoutList: [],
          ),
        );
        return;
      }

      workoutList[workoutIndex].exercise.add(
            Exercise(
              exerciseName: event.exercise.exerciseName,
              reps: event.exercise.reps,
              sets: event.exercise.sets,
              weight: event.exercise.weight,
            ),
          );

      emit(WorkoutListLoaded(workoutList: workoutList));
    });
  }
}
