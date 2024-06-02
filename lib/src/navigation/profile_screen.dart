import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: const ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<File> galleryFiles = [];
  List<String> captions = List.filled(6, '');
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Building Profile Screen");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.book),
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Select Image from Gallery and Camera'),
              onPressed: () {
                print("Pressed select image button");
                if (galleryFiles.length < 6) {
                  _showPicker(context: context);
                } else {
                  print("Max image limit reached");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You can only select up to 6 images')),
                  );
                }
              },
            ),
            SizedBox(
              height: 200,
              child: galleryFiles.isNotEmpty
                  ? PageView.builder(
                      itemCount: galleryFiles.length,
                      itemBuilder: (context, index) {
                        print("Displaying image ${index + 1}");
                        return Column(
                          children: <Widget>[
                            Expanded(
                              child: Image.file(
                                galleryFiles[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (val) {
                                  setState(() {
                                    captions[index] = val;
                                  });
                                },
                                controller: TextEditingController(text: captions[index]),
                                decoration: InputDecoration(labelText: 'Caption for image ${index + 1}'),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : Center(child: Text('No images selected')),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker({required BuildContext context}) {
    print("Showing picker modal");
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  print("Picking image from gallery");
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  print("Picking image from camera");
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(ImageSource source) async {
  try {
    print("Attempting to get image from $source");
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      print("Image picked successfully");
      setState(() {
        if (galleryFiles.length < 6) {
          galleryFiles.add(File(pickedFile.path));
          print("Image added to galleryFiles list");
        }
      });
    } else {
      print("Failed to pick image: File was null");
    }
  } catch (e) {
    print("Error picking image: $e");
  }
}

}
