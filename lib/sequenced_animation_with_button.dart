import 'package:flutter/material.dart';

class SequencedAnimationWithButton extends StatefulWidget {
  const SequencedAnimationWithButton({super.key});

  @override
  State<SequencedAnimationWithButton> createState() =>
      _SequencedAnimationWithButtonState();
}

class _SequencedAnimationWithButtonState
    extends State<SequencedAnimationWithButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  bool _isComplete = true;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _sizeAnimation = Tween<double>(begin: 50, end: 180).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _colorAnimation =
        ColorTween(begin: Colors.deepOrangeAccent, end: Colors.greenAccent)
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Container(
                      width: _sizeAnimation.value,
                      height: _sizeAnimation.value,
                      color: _colorAnimation.value,
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isComplete) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
          _isComplete = !_isComplete;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
