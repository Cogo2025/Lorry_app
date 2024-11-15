import 'package:flutter/material.dart';
import 'owner_dashboard_page.dart'; // Import your OwnerDashboardPage

class OwnerDetailsPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController cinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 114, 71, 255), // Light purple
              Color.fromARGB(255, 120, 122, 255), // Blue-purple
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(  // Allow scrolling
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 350, // Set fixed width for the container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Owner Details',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Please enter your details',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),

                    // Name Input
                    _buildTextField(
                      controller: nameController,
                      label: 'Name',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16),

                    // Company Name Input
                    _buildTextField(
                      controller: companyNameController,
                      label: 'Company Name',
                      icon: Icons.business,
                    ),
                    const SizedBox(height: 16),

                    // Location Input
                    _buildTextField(
                      controller: locationController,
                      label: 'Location',
                      icon: Icons.location_on,
                    ),
                    const SizedBox(height: 16),

                    // CIN Number Input
                    _buildTextField(
                      controller: cinController,
                      label: 'CIN Number',
                      icon: Icons.credit_card,
                    ),
                    const SizedBox(height: 16),

                    // Save Button
                    Center( // Center the button
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue, // Set button color to blue
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                        ),
                        onPressed: () {
                          // Navigate to OwnerDashboardPage when Save is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OwnerDashboardPage(ownerName: '',),
                            ),
                          );
                        },
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
