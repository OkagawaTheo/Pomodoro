final a = ElevatedButton(
  //start button
  style: ButtonStyle(
      minimumSize: MaterialStateProperty.resolveWith<Size?>((states) {
    return const Size(150, 50);
  }), backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
    if (states.contains(MaterialState.hovered)) {
      return const Color(0xffD0C3FF);
    }
    return Colors.blue;
  })),
  child: const Text('Start studying'),
  onPressed: () {
    if (_minutes > 0) {
      start();
    }
  },
),

