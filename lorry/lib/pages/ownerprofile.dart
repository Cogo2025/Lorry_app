import 'package:flutter/material.dart';

class OwnerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
              color: Colors.purple[800], // Violet color for the header
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile image
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/owner_profile.png'), // Replace with your image path
                ),
                SizedBox(height: 10),
                // Owner's name
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Profile details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Age
                ProfileDetail(title: 'Age', value: '35'),
                Divider(),
                // Email
                ProfileDetail(title: 'Email', value: 'johndoe@example.com'),
                Divider(),
                // Phone number
                ProfileDetail(title: 'Phone', value: '+1 234 567 890'),
                Divider(),
                // Number of trucks owned
                ProfileDetail(title: 'Trucks Owned', value: '5'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for profile details
class ProfileDetail extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetail({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
