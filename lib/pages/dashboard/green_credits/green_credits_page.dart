import 'package:flutter/material.dart';
import '../dashboard_layout.dart';
import 'components/badge_card.dart';

class GreenCreditsPage extends StatelessWidget {
  const GreenCreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = [
      {
        'icon': Icons.water_drop,
        'title': 'Water Saver',
        'description': 'Reduced water usage by 20%',
        'tier': 'Gold',
        'date': 'Jan 2024',
      },
      {
        'icon': Icons.grass,
        'title': 'Soil Guardian',
        'description': 'Improved soil organic matter',
        'tier': 'Silver',
        'date': 'Dec 2023',
      },
      {
        'icon': Icons.shield,
        'title': 'Pest Defender',
        'description': 'Used organic pest control methods',
        'tier': 'Silver',
        'date': 'Nov 2023',
      },
      {
        'icon': Icons.sunny,
        'title': 'Energy Efficient',
        'description': 'Adopted solar-powered pumps',
        'tier': 'Bronze',
        'date': 'Oct 2023',
      },
    ];

    return DashboardLayout(
      currentPage: 'Green Credits',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Green Credits",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D5F2E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Track your sustainable farming practices and earn rewards.",
            style: TextStyle(fontSize: 16, color: Color(0xFF5F7D5F)),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4E7D4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.5)),
                  ),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.emoji_events,
                        size: 64,
                        color: Color(0xFF4CAF50),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "1,250",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D5F2E),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Total Green Credits",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF5F7D5F),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4E7D4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Eco-Level: Eco-Warrior",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF2D5F2E),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Your progress towards the next level: Eco-Champion",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF5F7D5F),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const LinearProgressIndicator(
                          value: 0.6,
                          minHeight: 8,
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF4CAF50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "1,000 pts",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF5F7D5F),
                            ),
                          ),
                          Text(
                            "1,500 pts",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF5F7D5F),
                            ),
                          ),
                          Text(
                            "2,000 pts",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF5F7D5F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Badges Earned",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF2D5F2E),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Recognitions for your sustainable achievements.",
                  style: TextStyle(fontSize: 14, color: Color(0xFF5F7D5F)),
                ),
                const SizedBox(height: 24),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: badges.length,
                  itemBuilder: (context, index) {
                    final badge = badges[index];
                    return BadgeCard(
                      icon: badge['icon'] as IconData,
                      title: badge['title'] as String,
                      description: badge['description'] as String,
                      tier: badge['tier'] as String,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
