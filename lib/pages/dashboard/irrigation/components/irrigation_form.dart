import 'package:flutter/material.dart';

class IrrigationPage extends StatefulWidget {
  const IrrigationPage({super.key});

  @override
  State<IrrigationPage> createState() => _IrrigationPageState();
}

class _IrrigationPageState extends State<IrrigationPage> {
  final _formKey = GlobalKey<FormState>();
  final _cropTypeController = TextEditingController();
  final _fieldConditionsController = TextEditingController();
  final _weatherForecastController = TextEditingController();
  final _historicalDataController = TextEditingController();

  bool _isLoading = false;
  Map<String, String>? _scheduleData;
  String? _errorMessage;

  Future<void> _generateSchedule() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _scheduleData = null;
    });

    try {
      // Simulate API / AI call
      await Future.delayed(const Duration(seconds: 2));

      // Replace with real AI data
      _scheduleData = {
        "schedule": "Water field every 3 days at 6 AM, 1500L per hectare",
        "forecastAdjustments":
            "Reduce watering by 10% due to upcoming rainfall on Wednesday",
        "additionalNotes": "Monitor soil moisture daily for best results",
      };
    } catch (e) {
      _errorMessage = "Failed to generate schedule. Try again.";
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _cropTypeController.dispose();
    _fieldConditionsController.dispose();
    _weatherForecastController.dispose();
    _historicalDataController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? 'This field is required' : null,
    );
  }

  Widget _buildCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personalized Irrigation Guidance")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              "Personalized Irrigation Guidance",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Generate a tailored irrigation schedule using AI.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                    label: "Crop Type",
                    hint: "e.g., Corn, Wheat, Tomatoes",
                    controller: _cropTypeController,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: "Field Conditions",
                    hint: "e.g., Loamy soil, 40% moisture",
                    controller: _fieldConditionsController,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: "7-Day Weather Forecast",
                    hint:
                        "e.g., Avg temp 25°C, 10mm rain expected, 60% humidity",
                    controller: _weatherForecastController,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: "Historical Data",
                    hint:
                        "e.g., Last watered 3 days ago, 2000L. Previous yield: 5 tons/acre.",
                    controller: _historicalDataController,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Error
                  if (_errorMessage != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.red[100],
                      child: Row(
                        children: [
                          const Icon(Icons.error, color: Colors.red),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Submit button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.schedule),
                      label: const Text("Generate Schedule"),
                      onPressed: _isLoading ? null : _generateSchedule,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Generated schedule
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_scheduleData != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCard("Schedule", _scheduleData!["schedule"]!),
                  _buildCard(
                    "Forecast Adjustments",
                    _scheduleData!["forecastAdjustments"]!,
                  ),
                  _buildCard(
                    "Additional Notes",
                    _scheduleData!["additionalNotes"]!,
                  ),
                ],
              )
            else
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      Icon(Icons.info_outline, size: 48, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        "Your irrigation schedule will appear here.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
