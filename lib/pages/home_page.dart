import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  double _radius = 100;
  double _fontSize = 15;
  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);

  AnimationController? _startIcon;
  @override
  void initState() {
    super.initState();
    _startIcon = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _startIcon!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _circleAnimation(),
              _starIcon(),
            ],
          )
        ],
      ),
    ));
  }

  Widget _background() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      duration: const Duration(seconds: 2),
      builder: (_context, double _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Colors.blue,
      ),
    );
  }

  Widget _circleAnimation() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _radius += _radius == 200 ? -100 : 100;
            _fontSize += _radius == 200 ? 20 : -20;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          width: _radius,
          height: _radius,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
            color: Colors.deepPurple,
          ),
          child: Center(
            child: Text(
              'Bingo!',
              style: TextStyle(
                color: Colors.white60,
                fontSize: _fontSize,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _starIcon() {
    return AnimatedBuilder(
      animation: _startIcon!.view,
      builder: (_buildContext, _child) {
        return Transform.rotate(
          angle: _startIcon!.value * 2 * pi,
          child: _child,
        );
      },
      child: const Icon(
        Icons.star,
        color: Colors.white,
        size: 200,
      ),
    );
  }
}
