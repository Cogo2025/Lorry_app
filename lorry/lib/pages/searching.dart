import 'package:flutter/material.dart';

class SearchingPage extends StatelessWidget {
  const SearchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with filter buttons
          Container(
            color: Colors.purple.shade100,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                // Filter row
                Row(
                  children: [
                    _buildFilterButton("Filter"),
                    SizedBox(width: 10),
                    _buildFilterButton("Truck Type"),
                  ],
                ),
                SizedBox(height: 10),
                // Horizontal scrollable buttons row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildRoundedButton("Option 1"),
                      _buildRoundedButton("Option 2"),
                      _buildRoundedButton("Option 3"),
                      _buildRoundedButton("Option 4"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // List of cards below the filters
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

  // Filter button builder
  Widget _buildFilterButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(text),
    );
  }

  // Rounded button builder
  Widget _buildRoundedButton(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(text),
      ),
    );
  }

  // Card builder with dividing line
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
    home: SearchingPage(),
  ));
}
