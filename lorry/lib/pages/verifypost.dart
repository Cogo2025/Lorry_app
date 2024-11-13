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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Post'),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
        elevation: 0,
      ),
      body: SingleChildScrollView( // This will make the entire page scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align left for better spacing
          children: [

            const SizedBox(height: 20),
            const Text(
              'Verify Selected Images',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (widget.images.isEmpty) // Handle the case where no images are selected
              const Text(
                'No images selected',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            const SizedBox(height: 20),
            // Images will still scroll within this ListView
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
                                  width: MediaQuery.of(context).size.width * 0.8, // Adjusted width (80% of screen width)
                                  height: 150, // Reduced height for smaller image boxes
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
            ),
                        const Text(
              'Verify Selected Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Editable text fields inside gray boxes, now only readable
            _buildEditableDetailBox(widget.truckType, 'Truck Type'),
            const SizedBox(height: 8),
            _buildEditableDetailBox(widget.bsVersion, 'BS Version'),
            const SizedBox(height: 8),
            _buildEditableDetailBox(widget.driverType, 'Driver Type'),
            const SizedBox(height: 8),
            _buildEditableDetailBox(widget.timeDuration, 'Time Duration'),
            const SizedBox(height: 8),
            _buildEditableDetailBox(widget.location, 'Location'),
          ],
        ),
      ),
    );
  }

  // Helper function to create editable text field in a styled gray box (only readable)
  Widget _buildEditableDetailBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light gray background
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
