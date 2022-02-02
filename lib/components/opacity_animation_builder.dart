import 'package:flutter/material.dart';

class OpacityAnimationBuilder extends StatefulWidget {
  Widget child;

  OpacityAnimationBuilder({Key? key, required this.child}) : super(key: key);

  @override
  _OpacityAnimationBuilderState createState() =>
      _OpacityAnimationBuilderState();
}

class _OpacityAnimationBuilderState extends State<OpacityAnimationBuilder>
    with SingleTickerProviderStateMixin {
  Animation? opacityAnimation;
  AnimationController? opacityAnimationController;

  @override
  void initState() {
    opacityAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: opacityAnimationController!,
        curve: Curves.linear,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    opacityAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      opacityAnimationController?.forward();
    });

    return AnimatedBuilder(
      animation: opacityAnimationController!,
      builder: (context, child) {
        return Opacity(
          opacity: opacityAnimation!.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
