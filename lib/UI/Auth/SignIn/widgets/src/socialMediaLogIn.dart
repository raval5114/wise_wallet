import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaLogIn extends StatefulWidget {
  const SocialMediaLogIn({super.key});

  @override
  State<SocialMediaLogIn> createState() => _SocialMediaLogInState();
}

class _SocialMediaLogInState extends State<SocialMediaLogIn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.facebook, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.apple, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
          onPressed: () {
            debugPrint("yes its working");
          },
        )
      ],
    );
  }
}
