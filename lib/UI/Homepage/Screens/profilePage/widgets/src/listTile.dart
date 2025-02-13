import 'package:flutter/material.dart';

class ListTileForProfilePage extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback callBack;

  const ListTileForProfilePage(this.title,
      {super.key, required this.callBack, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: callBack,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(icon,
                  color: Colors.white, size: 20), // Replace with relevant icon
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios,
                size: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
