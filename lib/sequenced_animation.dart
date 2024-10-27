import 'package:flutter/material.dart';

class SequencedAnimation extends StatefulWidget {
  const SequencedAnimation({super.key});

  @override
  State<SequencedAnimation> createState() => _SequencedAnimationState();
}

class _SequencedAnimationState extends State<SequencedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _sizeAnimation = Tween<double>(begin: 50, end: 150).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut)));

    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));

    _animationController.forward();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: _colorAnimation.value,
            );
          }),
    ));
  }
}
