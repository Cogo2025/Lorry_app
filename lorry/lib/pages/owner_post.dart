import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'verifypost.dart';
class OwnerPostPage extends StatefulWidget {
  const OwnerPostPage({Key? key}) : super(key: key);
  @override
  _OwnerPostPageState createState() => _OwnerPostPageState();
}
class _OwnerPostPageState extends State<OwnerPostPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedImages = [];
  TextEditingController _truckTypeController = TextEditingController();
  TextEditingController _bsVersionController = TextEditingController();
  TextEditingController _driverTypeController = TextEditingController();
  TextEditingController _timeDurationController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  Future<void> _pickImagesFromGallery() async {
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null && images.isNotEmpty && images.length <= 4) {
      setState(() {
        _selectedImages = images.take(4).toList(); // Limit to 4 images
      });
    }
  }
  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      _selectedImages = [image];
                    });
                  }
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImagesFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _goToVerifyPostPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VerifyPostPage(
          images: _selectedImages,
          truckType: _truckTypeController.text,
          bsVersion: _bsVersionController.text,
          driverType: _driverTypeController.text,
          timeDuration: _timeDurationController.text,
          location: _locationController.text,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
        elevation: 0,
      ),
      body: SingleChildScrollView( // Add SingleChildScrollView to handle overflow
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            _buildEditableTextField(_truckTypeController, 'Truck Type'),
            const SizedBox(height: 16),
            _buildEditableTextField(_bsVersionController, 'BS-version'),
            const SizedBox(height: 16),
            _buildEditableTextField(_driverTypeController, 'Driver Type'),
            const SizedBox(height: 16),
            _buildEditableTextField(_timeDurationController, 'Time Duration'),
            const SizedBox(height: 16),
            _buildEditableTextField(_locationController, 'Location'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                _showImageSourceDialog(context); // Show dialog when button is pressed
              },
              icon: const Icon(Icons.add_a_photo),
              label: const Text('Add Photo'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.grey[800],
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: _goToVerifyPostPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildEditableTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,  // Set the controller to handle input
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
