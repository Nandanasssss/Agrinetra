import 'package:flutter/material.dart';

class BadgeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String tier;

  const BadgeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.tier,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    switch (tier) {
      case 'Gold':
        bgColor = Colors.yellow.shade600;
        break;
      case 'Silver':
        bgColor = Colors.grey.shade400;
        break;
      default:
        bgColor = Colors.orange.shade400;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: bgColor,
              radius: 24,
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(tier, style: const TextStyle(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
