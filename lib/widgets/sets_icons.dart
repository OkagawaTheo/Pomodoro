import 'package:flutter/material.dart';

class SetsIcons extends StatelessWidget {
  const SetsIcons({super.key, required this.total, required this.done});
  final int total;
  final int done;

  @override
  Widget build(BuildContext context) {
    const doneIcon = Icon(
      Icons.circle,
      color: Color.fromARGB(255, 135, 99, 236),
    );

    const notDoneIcon = Icon(
      Icons.circle_outlined,
      color: Color.fromARGB(255, 85, 140, 168),
    );

    List<Icon> icons = [];
    for (int i = 0; i < total; i++) {
      if (i < done) {
        icons.add(doneIcon);
      } else {
        icons.add(notDoneIcon);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, 
      
      children: icons),
    );
  }
}

