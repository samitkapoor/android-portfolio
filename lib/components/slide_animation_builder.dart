import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideAnimationBuilder extends StatefulWidget {
  Widget child;
  double begin;
  double end;
  Duration duration;

  SlideAnimationBuilder({
    Key? key,
    required this.child,
    required this.begin,
    required this.end,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _SlideAnimationBuilderState createState() => _SlideAnimationBuilderState();
}

class _SlideAnimationBuilderState extends State<SlideAnimationBuilder>
    with SingleTickerProviderStateMixin {
  Animation? rtlAnimation;
  AnimationController? rtlAnimationController;

  @override
  void initState() {
    rtlAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    rtlAnimation = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(
      CurvedAnimation(
        parent: rtlAnimationController!,
        curve: Curves.elasticOut,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    rtlAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(widget.duration).then((value) {
      rtlAnimationController?.forward();
    });

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: rtlAnimationController!,
          builder: (context, child) {
            return Positioned(
              left: rtlAnimation!.value,
              child: child as Widget,
            );
          },
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
