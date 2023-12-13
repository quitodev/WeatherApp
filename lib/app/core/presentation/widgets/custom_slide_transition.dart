part of 'widgets.dart';

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({
    required super.child,
    super.key,
  }) : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
}
