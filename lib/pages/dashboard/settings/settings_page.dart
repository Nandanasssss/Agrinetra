import 'package:flutter/material.dart';
import '../dashboard_layout.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Farmer Account Info
  final TextEditingController farmerNameController = TextEditingController(
    text: "Rajesh Kumar",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+91 98765 43210",
  );
  final TextEditingController emailController = TextEditingController(
    text: "rajesh.farmer@example.com",
  );
  final TextEditingController farmNameController = TextEditingController(
    text: "Green Valley Farm",
  );
  final TextEditingController farmLocationController = TextEditingController(
    text: "Kochi, Kerala, India",
  );
  final TextEditingController farmSizeController = TextEditingController(
    text: "5.2 hectares",
  );
  final TextEditingController cropsController = TextEditingController(
    text: "Rice, Coconut, Vegetables",
  );

  // Preferences
  String language = "en";
  bool pushNotifications = true;
  bool weatherAlerts = true;
  bool pestAlerts = true;

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      currentPage: 'Settings',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Account & Settings",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D5F2E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Manage your farm account and preferences.",
            style: TextStyle(fontSize: 16, color: Color(0xFF5F7D5F)),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 900) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _accountInfoCard()),
                    const SizedBox(width: 16),
                    Expanded(flex: 1, child: _preferencesCard()),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _accountInfoCard(),
                    const SizedBox(height: 16),
                    _preferencesCard(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _accountInfoCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.account_circle, color: Color(0xFF4CAF50), size: 28),
              SizedBox(width: 12),
              Text(
                "Farmer Account Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D5F2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Update your personal and farm details.",
            style: TextStyle(fontSize: 14, color: Color(0xFF5F7D5F)),
          ),
          const SizedBox(height: 24),

          // Personal Information Section
          const Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D5F2E),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: farmerNameController,
            decoration: const InputDecoration(
              labelText: "Farmer Name",
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4CAF50), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4CAF50),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4CAF50),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),

          // Farm Information Section
          const Text(
            "Farm Information",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D5F2E),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: farmNameController,
            decoration: const InputDecoration(
              labelText: "Farm Name",
              prefixIcon: Icon(Icons.agriculture),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4CAF50), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: farmLocationController,
            decoration: const InputDecoration(
              labelText: "Farm Location",
              prefixIcon: Icon(Icons.location_on),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4CAF50), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: farmSizeController,
                  decoration: const InputDecoration(
                    labelText: "Farm Size",
                    prefixIcon: Icon(Icons.crop_square),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4CAF50),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: cropsController,
                  decoration: const InputDecoration(
                    labelText: "Main Crops",
                    prefixIcon: Icon(Icons.grass),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4CAF50),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Save Account Information"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Account information saved successfully!"),
                    backgroundColor: Color(0xFF4CAF50),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _preferencesCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.tune, color: Color(0xFF4CAF50), size: 28),
              SizedBox(width: 12),
              Text(
                "Preferences",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D5F2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Customize your app experience.",
            style: TextStyle(fontSize: 14, color: Color(0xFF5F7D5F)),
          ),
          const SizedBox(height: 24),

          // Language Dropdown
          DropdownButtonFormField<String>(
            value: language,
            decoration: const InputDecoration(
              labelText: "Language",
              prefixIcon: Icon(Icons.language),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4CAF50), width: 2),
              ),
            ),
            items: const [
              DropdownMenuItem(value: "en", child: Text("English")),
              DropdownMenuItem(value: "hi", child: Text("हिंदी (Hindi)")),
              DropdownMenuItem(value: "ml", child: Text("മലയാളം (Malayalam)")),
              DropdownMenuItem(value: "ta", child: Text("தமிழ் (Tamil)")),
              DropdownMenuItem(value: "te", child: Text("తెలుగు (Telugu)")),
            ],
            onChanged: (value) {
              setState(() {
                language = value!;
              });
            },
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D5F2E),
            ),
          ),
          const SizedBox(height: 12),

          // Push Notifications
          SwitchListTile(
            title: const Text(
              "Push Notifications",
              style: TextStyle(color: Color(0xFF2D5F2E)),
            ),
            subtitle: const Text(
              "Receive all notifications",
              style: TextStyle(color: Color(0xFF5F7D5F), fontSize: 12),
            ),
            value: pushNotifications,
            activeColor: const Color(0xFF4CAF50),
            onChanged: (val) => setState(() => pushNotifications = val),
            contentPadding: EdgeInsets.zero,
          ),

          // Weather Alerts
          SwitchListTile(
            title: const Text(
              "Weather Alerts",
              style: TextStyle(color: Color(0xFF2D5F2E)),
            ),
            subtitle: const Text(
              "Get weather updates",
              style: TextStyle(color: Color(0xFF5F7D5F), fontSize: 12),
            ),
            value: weatherAlerts,
            activeColor: const Color(0xFF4CAF50),
            onChanged: (val) => setState(() => weatherAlerts = val),
            contentPadding: EdgeInsets.zero,
          ),

          // Pest Alerts
          SwitchListTile(
            title: const Text(
              "Pest Alerts",
              style: TextStyle(color: Color(0xFF2D5F2E)),
            ),
            subtitle: const Text(
              "Alerts for pest threats",
              style: TextStyle(color: Color(0xFF5F7D5F), fontSize: 12),
            ),
            value: pestAlerts,
            activeColor: const Color(0xFF4CAF50),
            onChanged: (val) => setState(() => pestAlerts = val),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
