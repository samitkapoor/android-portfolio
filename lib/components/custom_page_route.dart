import 'package:flutter/material.dart';

enum Transitions { slide, scale }

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final Transitions transition;
  final Duration duration;
  Offset offset;
  Curve curve;

  CustomPageRoute({
    required this.child,
    required this.transition,
    required this.duration,
    this.offset = const Offset(0, 1),
    this.curve = Curves.ease,
  }) : super(
          transitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (transition == Transitions.slide) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: offset,
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: curve),
        ),
        child: child,
      );
    } else {
      return ScaleTransition(scale: animation, child: child);
    }
  }
}
