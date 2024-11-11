import 'package:flutter/material.dart';
import 'like.dart';
import 'notiee.dart';

class OwnerDashboardPage extends StatefulWidget {
  final String username;

  const OwnerDashboardPage({super.key, required this.username});

  @override
  _OwnerDashboardPageState createState() => _OwnerDashboardPageState();
}

class _OwnerDashboardPageState extends State<OwnerDashboardPage> {
  bool viewMore = false;
  bool _showSearchBar = false;
  List<String> items = List.generate(8, (index) => 'Item ${index + 1}');
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _showSearchBar ? 160 : 120,
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
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotieePage()),
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  setState(() {
                    _showSearchBar = !_showSearchBar;
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
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
            : null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  _buildImagePlaceholder('Asset 1'),
                  _buildImagePlaceholder('Asset 2'),
                  _buildImagePlaceholder('Asset 3'),
                  _buildImagePlaceholder('Asset 4'),
                  _buildImagePlaceholder('Asset 5'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: viewMore
                        ? items.length
                        : (items.length > 6 ? 6 : items.length),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 32),
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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color(0xFF7247FF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomLayoutPage()),
                );
              },
            ),
            const SizedBox(width: 40), // Space for the FloatingActionButton
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 175, 129, 255),
              ),
              child: Text(
                'Owner Menu',
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
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Icon(Icons.error)),
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
