import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_card/pages/workout_page.dart';
import '../app/workout_list/workout_list_bloc.dart';
import '../components/workout_tile.dart';
import '../models/workout_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newWorkoutNameController = TextEditingController();

  void addWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blueGrey[700],
        title: const Text('Add new Workout'),
        content: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blueGrey[300],
          ),
          child: TextField(
            controller: newWorkoutNameController,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
            ),
            cursorWidth: 2,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Workout Name',
            ),
          ),
        ),
        actions: [
          // save
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: saveWorkout,
                color: Colors.blueGrey[900],
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 5),

              // cancel
              MaterialButton(
                onPressed: cancel,
                color: Colors.blueGrey[900],
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void saveWorkout() {
    context.read<WorkoutListBloc>().add(
          AddWorkoutToList(
            workout: Workout(
              exercise: [],
              workoutName: newWorkoutNameController.text,
            ),
          ),
        );

    Navigator.pop(context);
    newWorkoutNameController.clear();
  }

  void cancel() {
    Navigator.pop(context);
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addWorkout,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Workout Tracker',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
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
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey[500],
              ),
            );
          }
          return ListView.builder(
            itemCount: state.workoutList.length,
            itemBuilder: (context, index) => WorkoutTile(
              title: state.workoutList[index].workoutName,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => WorkoutListBloc(),
                      child: WorkoutPage(
                        workoutNameAppBar: state.workoutList[index].workoutName,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
