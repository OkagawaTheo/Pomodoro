import 'package:flutter/material.dart';
class SetsIcons extends StatefulWidget {
  const SetsIcons({super.key});

  @override
  State<SetsIcons> createState() => SetsIconsState();
}

class SetsIconsState extends State<SetsIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //progress
        height: 150,
        width: 300,
        padding: const EdgeInsets.only(top: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [Text('Hello World!')],
        ));
  }
}
