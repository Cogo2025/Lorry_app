import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class DriverDashboardPage extends StatefulWidget {
  final String username;

  const DriverDashboardPage({Key? key, required this.username}) : super(key: key);

  @override
  _DriverDashboardPageState createState() => _DriverDashboardPageState();
}

class _DriverDashboardPageState extends State<DriverDashboardPage> {
  bool viewMore = false;
  bool _showSearchBar = false; // Flag to toggle search bar visibility
  List<String> items = List.generate(8, (index) => 'Item ${index + 1}');
  int _selectedIndex = 0; // Track the selected index for navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _showSearchBar ? 160 : 120, // Adjust height based on search bar visibility
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
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Welcome, ${widget.username}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            // Notification Icon with white circle
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // White background
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black), // Black icon color
                onPressed: () {
                  // Handle bell button press
                },
              ),
            ),
            const SizedBox(width: 8), // Add spacing between icons
            // Search Icon with white circle
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // White background
              ),
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.black), // Black icon color
                onPressed: () {
                  setState(() {
                    _showSearchBar = !_showSearchBar; // Toggle search bar visibility
                  });
                },
              ),
            ),
          ],
        ),
        bottom: _showSearchBar
            ? PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Padding(
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
              )
            : null, // Show bottom search bar if _showSearchBar is true
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              height: 200,
              child: PageView(
                children: [
                  _buildImagePlaceholder('Car 1'),
                  _buildImagePlaceholder('Car 2'),
                  _buildImagePlaceholder('Car 3'),
                  _buildImagePlaceholder('Car 4'),
                  _buildImagePlaceholder('Car 5'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 400,
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: viewMore ? items.length : (items.length > 6 ? 6 : items.length),
                    itemBuilder: (context, index) {
                      return _buildGridItem(index);
                    },
                  ),
                  if (!viewMore)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            viewMore = true;
                          });
                        },
                        child: const Text('View More'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
  index: _selectedIndex,
  items: <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.person, size: 30),
    Icon(Icons.add, size: 30, color: Colors.white), // Add button
    Icon(Icons.shopping_cart, size: 30),
    Icon(Icons.favorite, size: 30),
  ],
  color: const Color(0xFF7247FF),
  buttonBackgroundColor: const Color.fromARGB(255, 175, 129, 255),
  backgroundColor: const Color.fromARGB(255, 255, 253, 253),
  onTap: (index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
    
    if (index == 2) {
      // Action for "+" button
      // For example, navigate to a new page or open a dialog

    }
  },
),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 175, 129, 255),
              ),
              child: Text(
                'Driver Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://via.placeholder.com/400x200?text=$text',
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    if (index < 0 || index >= items.length) return const SizedBox();

    return Card(
      elevation: 4,
      child: Center(
        child: Text(items[index], style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
