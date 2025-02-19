import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/user.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    String profileImage =
        "${userSession.firstName?[0]}" "${userSession.lastName?[0]}";
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          child: Text(
            profileImage,
            style: TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${userSession.firstName} ${userSession.lastName}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(width: 5),
          ],
        ),
        Text(
          "${userSession.email}",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
