import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// Assuming CustomLayoutPage, OwnerProfile, and OwnerPostPage are already defined
import 'like.dart';
import 'ownerprofile.dart';
import 'owner_post.dart';

class OwnerDashboardPage extends StatefulWidget {
  final String ownerName;

  const OwnerDashboardPage({Key? key, required this.ownerName}) : super(key: key);

  @override
  _OwnerDashboardPageState createState() => _OwnerDashboardPageState();
}

class _OwnerDashboardPageState extends State<OwnerDashboardPage> {
  int _selectedIndex = 0; // Track the selected index for navigation
  bool _filterByAge = false; // Checkbox state for Age
  bool _filterByLocation = false; // Checkbox state for Location

  void _showFilterBar() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('Filter by Age'),
                value: _filterByAge,
                onChanged: (bool? value) {
                  setState(() {
                    _filterByAge = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Filter by Location'),
                value: _filterByLocation,
                onChanged: (bool? value) {
                  setState(() {
                    _filterByLocation = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the modal
                },
                child: const Text('Apply Filters'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onNavigationItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) { // Navigate to OwnerProfile when person icon is selected
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OwnerProfile()),
      );
    } else if (index == 3) { // Navigate to CustomLayoutPage when favorite icon is selected
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomLayoutPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 114, 71, 255),
                Color.fromARGB(255, 120, 122, 255),
              ],
            ),
          ),
        ),
        title: Text(
          'Welcome, ${widget.ownerName}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {
                    // Handle notification button press
                  },
                ),
              ),
              const SizedBox(width: 16),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.black),
                  onPressed: () {
                    _showFilterBar();
                  },
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          CurvedNavigationBar(
            index: _selectedIndex,
            items: <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.person, size: 30), // Person icon at index 1
              ImageIcon(AssetImage("assets/images/lorryicon.png"),size: 30,),
              Icon(Icons.favorite, size: 30),
            ],
            color: const Color(0xFF7247FF),
            buttonBackgroundColor: const Color.fromARGB(255, 175, 129, 255),
            backgroundColor: const Color.fromARGB(255, 255, 253, 253),
            onTap: _onNavigationItemSelected,
          ),
          Positioned(
            top: -30,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              onPressed: () {
                // Navigate to OwnerPostPage when "+" button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OwnerPostPage()),
                );
              },
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}