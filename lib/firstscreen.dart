import 'package:flutter/material.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

/////
class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
      child: Text(
        "First screen tab , the example of tab bar programming",
        style: TextStyle(fontSize: 32),
      ),
    ));
  }
}
