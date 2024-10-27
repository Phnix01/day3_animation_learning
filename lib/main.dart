import 'package:day3_animation_learning/sequenced_animation.dart';
import 'package:day3_animation_learning/sequenced_animation_with_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SequencedAnimationWithButton(),
    );
  }
}
