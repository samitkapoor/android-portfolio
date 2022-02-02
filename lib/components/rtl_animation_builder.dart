import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RTLFadeAnimationBuilder extends StatefulWidget {
  Widget child;

  RTLFadeAnimationBuilder({Key? key, required this.child}) : super(key: key);

  @override
  _RTLFadeAnimationBuilderState createState() =>
      _RTLFadeAnimationBuilderState();
}

class _RTLFadeAnimationBuilderState extends State<RTLFadeAnimationBuilder>
    with SingleTickerProviderStateMixin {
  Animation? rtlAnimation;
  AnimationController? rtlAnimationController;

  @override
  void initState() {
    rtlAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    rtlAnimation = Tween<double>(
      begin: -1 * Get.width,
      end: 0,
    ).animate(CurvedAnimation(
        parent: rtlAnimationController!, curve: Curves.elasticOut));

    super.initState();
  }

  @override
  void dispose() {
    rtlAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      rtlAnimationController?.forward();
    });

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: rtlAnimationController!,
          builder: (context, child) {
            return Positioned(
                left: rtlAnimation!.value, child: child as Widget);
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
