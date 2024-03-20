import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _background(),
          _circleAnimation(),
        ],
      ),
    ));
  }

  Widget _background() {
    return Container(
      color: Colors.blue,
    );
  }

  Widget _circleAnimation() {
    return Center(
      child: GestureDetector(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
