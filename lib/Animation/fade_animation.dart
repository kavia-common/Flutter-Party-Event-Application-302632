import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

/// A small helper widget that fades and slides its [child] into view.
///
/// This replaces the old simple_animations v1 API (MultiTrackTween/Track/ControlledAnimation)
/// with the current v5 API (MovieTween + PlayAnimationBuilder).
class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..scene(duration: const Duration(milliseconds: 500))
          .tween<double>('opacity', Tween<double>(begin: 0.0, end: 1.0))
          .tween<double>('translateY', Tween<double>(begin: -30.0, end: 0.0),
              curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      child: child,
      builder: (context, value, child) {
        final opacity = value.get<double>('opacity');
        final translateY = value.get<double>('translateY');

        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, translateY),
            child: child,
          ),
        );
      },
    );
  }
}
