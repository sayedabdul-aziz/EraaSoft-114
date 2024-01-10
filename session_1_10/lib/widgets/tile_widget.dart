import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  const TileItem({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
