import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VerifyPostPage extends StatefulWidget {
  final List<XFile> images;
  final String truckType;
  final String bsVersion;
  final String driverType;
  final String timeDuration;
  final String location;

  const VerifyPostPage({
    Key? key,
    required this.images,
    required this.truckType,
    required this.bsVersion,
    required this.driverType,
    required this.timeDuration,
    required this.location,
  }) : super(key: key);

  @override
  _VerifyPostPageState createState() => _VerifyPostPageState();
}

class _VerifyPostPageState extends State<VerifyPostPage> {
  void _showEnhancedConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: ModalRoute.of(context)!.animation!, curve: Curves.easeIn),
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Row(
              children: const [
                Icon(Icons.warning, color: Colors.redAccent, size: 28),
                SizedBox(width: 10),
                Text('Verification'),
              ],
            ),
            content: const Text(
              'Are you sure you want to verify and post this content? Please ensure all details are accurate before proceeding.',
              style: TextStyle(fontSize: 16),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                child: const Text('No', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Yes, Post'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Add your post submission logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Post created Successfully'),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.green[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Post'),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Verify Selected Images',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (widget.images.isEmpty)
              const Text(
                'No images selected',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.images.isEmpty
                  ? [const Text('No images available')]
                  : widget.images.map((image) {
                      int index = widget.images.indexOf(image);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Image ${index + 1}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(image.path),
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Verify Selected Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildEditableDetailBox(widget.truckType, 'Truck Type'),
            const SizedBox(height: 8),
            _buildEditableDetailBox(widget.bsVersion, 'BS Version'),
            const SizedBox(height: 8),
            _buildEditableDetailBox(widget.driverType, 'Driver Type'),
            const SizedBox(height: 8),
            _buildEditableDetailBox(widget.timeDuration, 'Time Duration'),
            const SizedBox(height: 8),
            _buildEditableDetailBox(widget.location, 'Location'),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _showEnhancedConfirmationDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[200],
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text('Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableDetailBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
