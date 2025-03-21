import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String number;
  final VoidCallback onTap;

  const ContactTile({
    super.key,
    required this.name,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(name[0].toString()),
      ),
      title: Text(name),
      subtitle: Text(number),
      onTap: onTap,
    );
  }
}
