import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/src/inputForm.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/src/titleAndSubtitle.dart';

class FirstLastNamePage extends StatefulWidget {
  const FirstLastNamePage({super.key});

  @override
  State<FirstLastNamePage> createState() => _FirstLastNamePageState();
}

class _FirstLastNamePageState extends State<FirstLastNamePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _titleAnimation;
  late Animation<Offset> _inputFormAnimation;
  late Animation<Offset> _navigateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
          milliseconds: 600), // Reduced duration for faster animation
      vsync: this,
    );

    // Animations for sliding widgets
    _titleAnimation = Tween<Offset>(
            begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _inputFormAnimation = Tween<Offset>(
            begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _navigateAnimation = Tween<Offset>(
            begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start the animation when the widget builds
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _titleAnimation,
          child: TitleandSubtitle(),
        ),
        SlideTransition(
          position: _inputFormAnimation,
          child: InputForm(),
        ),
      ],
    );
  }
}
