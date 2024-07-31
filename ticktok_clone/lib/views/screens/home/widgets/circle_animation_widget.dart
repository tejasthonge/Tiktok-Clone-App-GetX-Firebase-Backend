import 'package:flutter/material.dart';

class CircularAnimetionWidget extends StatefulWidget {
  final Widget childWidget;
  const CircularAnimetionWidget({super.key, required this.childWidget});

  @override
  State<CircularAnimetionWidget> createState() =>
      _CircularAnimetionWidgetState();
}

class _CircularAnimetionWidgetState extends State<CircularAnimetionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.forward();
    _animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(_animationController),
      child: widget.childWidget,
    );
  }
}
