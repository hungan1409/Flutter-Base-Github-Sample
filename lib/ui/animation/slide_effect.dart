import 'package:flutter/material.dart';

class SlideEffect extends StatefulWidget {
  const SlideEffect({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<SlideEffect> createState() => _SlideEffectState();
}

class _SlideEffectState extends State<SlideEffect>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();

    _slideAnimation = Tween<Offset>(begin: const Offset(0.25, 0.0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => false;
}
