import 'package:flutter/material.dart';

class listTileForProfilePage extends StatelessWidget {
  final String title;
  final VoidCallback callBack;
  const listTileForProfilePage(this.title, {super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: callBack,
    );
  }
}
