import 'package:flutter/material.dart';

class CustomLayoutPage extends StatelessWidget {
  const CustomLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Enhanced top container with gradient background and buttons
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade200, Colors.purple.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                // Header with icon and title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 28),
                    Text(
                      "Custom Layout Header",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.menu, color: Colors.white, size: 28),
                  ],
                ),
                SizedBox(height: 10),
                // Scrollable button row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildButton("Location"),
                      _buildButton("Button 1"),
                      _buildButton("Button 2"),
                      _buildButton("Button 3"),
                      _buildButton("Button 4"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                _buildCard(),
                SizedBox(height: 10),
                _buildCard(),
                SizedBox(height: 10),
                _buildCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Button builder
  Widget _buildButton(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(text),
      ),
    );
  }

  // Card builder
  Widget _buildCard() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(child: Container()),
          Container(
            width: 1,
            color: Colors.black,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomLayoutPage(),
  ));
}
