import 'package:flutter/material.dart';
import '../dashboard_layout.dart';

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
      await Future.delayed(const Duration(seconds: 2));

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
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF4CAF50), width: 2),
        ),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? 'This field is required' : null,
    );
  }

  Widget _buildResultCard(String title, String content) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD4E7D4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF2D5F2E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Color(0xFF5F7D5F)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      currentPage: 'Irrigation',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personalized Irrigation Guidance",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D5F2E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Generate a tailored irrigation schedule using AI.",
            style: TextStyle(fontSize: 16, color: Color(0xFF5F7D5F)),
          ),
          const SizedBox(height: 32),
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
                  hint: "e.g., Avg temp 25°C, 10mm rain expected, 60% humidity",
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
                if (_errorMessage != null)
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error, color: Colors.red),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _isLoading ? null : _generateSchedule,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_scheduleData != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildResultCard("Schedule", _scheduleData!["schedule"]!),
                _buildResultCard(
                  "Forecast Adjustments",
                  _scheduleData!["forecastAdjustments"]!,
                ),
                _buildResultCard(
                  "Additional Notes",
                  _scheduleData!["additionalNotes"]!,
                ),
              ],
            )
          else
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                children: const [
                  Icon(Icons.info_outline, size: 48, color: Color(0xFF5F7D5F)),
                  SizedBox(height: 16),
                  Text(
                    "Your irrigation schedule will appear here.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF5F7D5F), fontSize: 16),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
