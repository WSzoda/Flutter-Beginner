import 'package:flutter/material.dart';

class AnimatedBaloonWidget extends StatefulWidget {
  const AnimatedBaloonWidget({super.key});

  @override
  State<AnimatedBaloonWidget> createState() => _AnimatedBaloonWidgetState();
}

class _AnimatedBaloonWidgetState extends State<AnimatedBaloonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animationFloatUp;
  late Animation _animationGrowUp;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double balloonHeight = MediaQuery.of(context).size.height / 2;
    double balloonWidth = MediaQuery.of(context).size.width / 3;
    double ballonBottomLocation =
        MediaQuery.of(context).size.height - balloonHeight;

    _animationFloatUp = Tween(begin: ballonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _animationGrowUp = Tween(begin: 50.0, end: balloonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    );

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowUp.value,
          child: child,
        );
      },
      child: GestureDetector(
        child: Image.asset(
          'assets/images/BeginningGoogleFlutter-Balloon.png',
          height: balloonHeight,
          width: balloonWidth,
        ),
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
