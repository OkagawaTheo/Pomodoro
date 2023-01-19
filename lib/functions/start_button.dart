import 'package:flutter/material.dart';

final startButton = ElevatedButton(
  style: ButtonStyle(
    
    minimumSize: MaterialStateProperty.resolveWith<Size?>((states) {
    return const Size(150, 50);
  }), 
  
  backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
    if (states.contains(MaterialState.hovered)) {
      return const Color(0xffD0C3FF);
    }
    return Colors.blue;
  })),
  

  child: const Text('Start studying'),
  onPressed: () => {},
);

final stopButton = ElevatedButton(
  style: ButtonStyle(
    minimumSize: MaterialStateProperty.resolveWith<Size?>((states) {
      return const Size(150, 50);
    }),
    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.hovered)) {
        return const Color(0xffD0C3FF);
      }
      return Colors.blue; // normal color
    }),
  ),
  child: const Text('Stop'),
  onPressed: () => {},
);
