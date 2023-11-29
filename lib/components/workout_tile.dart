import 'package:flutter/material.dart';

class WorkoutTile extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const WorkoutTile({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
      ),
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ),
    );
  }
}
