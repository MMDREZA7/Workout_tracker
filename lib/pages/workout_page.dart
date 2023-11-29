import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_card/app/workout_list/workout_list_bloc.dart';
import 'package:my_card/components/exercise_tile.dart';
import 'package:my_card/models/exercise_model.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutNameAppBar;

  const WorkoutPage({
    super.key,
    required this.workoutNameAppBar,
  });

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  // text controllers
  final newExerciseNameController = TextEditingController();
  final newExerciseWeightController = TextEditingController();
  final newExerciseRepsController = TextEditingController();
  final newExerciseSetsController = TextEditingController();

  void addExercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'Add new Exercise',
          style: TextStyle(
            color: Colors.grey[300],
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // exersice name text feild
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueGrey[500],
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: TextField(
                style: TextStyle(
                  color: Colors.grey[300],
                ),
                controller: newExerciseNameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Exercise Name',
                  hintStyle: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            // weight text feild
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueGrey[500],
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: TextField(
                controller: newExerciseWeightController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'weight',
                  hintStyle: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            // reps text feild
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueGrey[500],
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: TextField(
                controller: newExerciseRepsController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'reps',
                  hintStyle: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            // sets text feild
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueGrey[500],
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: TextField(
                controller: newExerciseSetsController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'sets',
                  hintStyle: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // save button
              MaterialButton(
                color: Colors.blueGrey[500],
                onPressed: save,
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),

              const SizedBox(width: 5),

              // cancel button
              MaterialButton(
                color: Colors.blueGrey[500],
                onPressed: cancel,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void save() {
    context.read<WorkoutListBloc>().add(
          AddExerciesToList(
            workoutName: widget.workoutNameAppBar,
            exercise: Exercise(
              exerciseName: newExerciseRepsController.text,
              reps: newExerciseNameController.text,
              sets: newExerciseSetsController.text,
              weight: newExerciseWeightController.text,
            ),
          ),
        );
    Navigator.pop(context);
    newExerciseRepsController.clear();
    newExerciseNameController.clear();
    newExerciseSetsController.clear();
    newExerciseWeightController.clear();
  }

  void cancel() {
    Navigator.pop(context);

    newExerciseNameController.clear();
    newExerciseRepsController.clear();
    newExerciseSetsController.clear();
    newExerciseWeightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addExercise,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.workoutNameAppBar),
      ),
      body: BlocBuilder<WorkoutListBloc, WorkoutListState>(
        builder: (context, state) {
          if (state is WorkoutListError) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red[900],
            );
          }
          if (state is WorkoutListLoading) {
            CircularProgressIndicator(
              color: Colors.grey[900],
            );
          }
          return ListView.builder(
            itemCount: state.workoutList.length,
            itemBuilder: (context, index) => ExerciseTile(
              exerciseName: state.workoutList[index].exerciseName,
              reps: state.workoutList[index].reps,
              sets: state.workoutList[index].sets,
              weight: state.workoutList[index].weight,
            ),
          );
        },
      ),
    );
  }
}
