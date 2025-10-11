import 'package:flutter/material.dart';

class SoilHealthCharts extends StatelessWidget {
  const SoilHealthCharts({super.key});

  @override
  Widget build(BuildContext context) {
    // Example sensor data cards
    final sensors = [
      {"label": "Soil Moisture", "value": "53%", "desc": "Optimal"},
      {"label": "Soil pH", "value": "6.7", "desc": "Slightly Acidic"},
      {"label": "Temperature", "value": "24°C", "desc": "Warm"},
      {"label": "EC", "value": "1.6 dS/m", "desc": "Good"},
    ];

    return Column(
      children: [
        // Sensor cards
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: sensors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final sensor = sensors[index];
            return Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sensor["label"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      sensor["value"]!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sensor["desc"]!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        // Placeholder for charts
        Card(
          elevation: 2,
          child: SizedBox(
            height: 250,
            child: Center(
              child: Text(
                "Charts Placeholder",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
