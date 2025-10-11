import 'package:flutter/material.dart';
import '../dashboard_layout.dart';
import 'components/ndvi_map_card.dart';

class CropHealthPage extends StatelessWidget {
  const CropHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      currentPage: 'Crop Health',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Crop Health Monitoring",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D5F2E),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "NDVI-based analysis of your fields.",
            style: TextStyle(fontSize: 16, color: Color(0xFF5F7D5F)),
          ),
          SizedBox(height: 32),
          NDVIMapCard(),
        ],
      ),
    );
  }
}
