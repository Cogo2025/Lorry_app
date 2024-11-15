import 'package:flutter/material.dart';

class TruckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with tabs
          Container(
            color: Colors.purple.shade100,
            padding: EdgeInsets.only(top: 40, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTab("Tab 1", true),
                _buildTab("Tab 2", false),
              ],
            ),
          ),
          // List of cards
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tab builder with underline indicator
  Widget _buildTab(String title, bool isSelected) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4),
        if (isSelected)
          Container(
            height: 2,
            width: 60,
            color: Colors.black,
          ),
      ],
    );
  }

  // Card builder with dividing line and "Request Waiting..." label
  Widget _buildCard() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(child: Container()),
              Container(
                width: 1,
                color: Colors.black,
              ),
              Expanded(child: Container()),
            ],
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Request Waiting....",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TruckPage(),
  ));
}
