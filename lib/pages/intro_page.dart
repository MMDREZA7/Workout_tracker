import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_card/app/workout_list/workout_list_bloc.dart';
import 'package:my_card/components/button.dart';
import 'package:my_card/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // logo
              Image.asset(
                'images/workout.png',
                height: 180,
              ),

              // name
              Text(
                'Wellcome To \n  Workout Tracker',
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              // message
              Text(
                "You can track your workout exersices and do it by thsi app in week and month for free adn very eazy",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),

              // get start button
              MyButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => WorkoutListBloc(),
                        child: const HomePage(),
                      ),
                    ),
                  );
                },
                text: 'Get Start',
                color: Colors.blueGrey[500],
              )
            ],
          ),
        ),
      ),
    );
  }
}
