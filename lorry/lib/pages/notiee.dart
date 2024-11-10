import 'package:flutter/material.dart';

class NotieePage extends StatefulWidget {
  const NotieePage({super.key});

  @override
  _NotieePageState createState() => _NotieePageState();
}

class _NotieePageState extends State<NotieePage> {
  bool isNotificationTabSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top bar with back icon and tabs
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade100, Colors.purple.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                // Back button
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                // Tabs with underlines
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTab("Notification", isNotificationTabSelected, () {
                      setState(() {
                        isNotificationTabSelected = true;
                      });
                    }),
                    SizedBox(width: 30),
                    _buildTab("Matched", !isNotificationTabSelected, () {
                      setState(() {
                        isNotificationTabSelected = false;
                      });
                    }),
                  ],
                ),
              ],
            ),
          ),
          // List of cards below the tabs
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    _buildCard(
                      icon: Icons.notifications,
                      title: isNotificationTabSelected
                          ? 'New Notification ${index + 1}'
                          : 'Matched Item ${index + 1}',
                      subtitle:
                          'Details about ${isNotificationTabSelected ? 'notification' : 'matched item'} ${index + 1}',
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Tab builder with underline indicator
  Widget _buildTab(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.black54,
            ),
          ),
          SizedBox(height: 2),
          if (isSelected)
            Container(
              height: 2,
              width: 60,
              color: Colors.black,
            ),
        ],
      ),
    );
  }

  // Card builder
  Widget _buildCard(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.purple),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotieePage(),
  ));
}
