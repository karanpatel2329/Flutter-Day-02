// @dart=2.9
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
class FadeAnimation extends StatelessWidget {
  FadeAnimation({ this.delay,this.child});
  Widget child;
  double delay;
  final tween = MultiTrackTween([
    Track('opacity').add(Duration(milliseconds: 500),
        Tween(begin: 0.0, end: 1.0)),

    Track('translateY').add(Duration(milliseconds: 600),
        Tween(begin: 120.0, end: 0.0),
        curve: Curves.easeOut)
  ]);


  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      delay: Duration(milliseconds: (700 * delay).round()),
      duration: tween.duration,
      tween: tween,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation['opacity'],
        child: Transform.translate(
          offset: Offset(0, animation['translateY']),
          child: child,
        ),
      ),
      child:child,
    );
  }
}
