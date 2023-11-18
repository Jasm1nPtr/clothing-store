import 'dart:io';
import 'package:clothing_store_app/app/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';

class ProfilepageView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class UserProfile {
  String name;
  String imageUrl;
  String location;
  String bio;

  UserProfile({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.bio,
  });
}

class _ProfileViewState extends State<ProfilepageView> {
  List<UserProfile> profiles = [];

  Future<void> _addProfile() async {
    final picker = ImagePicker();
    XFile? pickedFile;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () async {
                    Navigator.pop(context);
                    try {
                      pickedFile =
                          await picker.pickImage(source: ImageSource.camera);
                      if (pickedFile == null) {
                        return;
                      }
                      final userProfile =
                          await _getUserProfileDetails(pickedFile!.path);
                      if (userProfile != null) {
                        setState(() {
                          profiles.add(userProfile);
                        });
                      }
                    } catch (e) {
                      print('Error picking image from camera: $e');
                    }
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () async {
                    Navigator.pop(context);
                    try {
                      pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile == null) {
                        return;
                      }
                      final userProfile =
                          await _getUserProfileDetails(pickedFile!.path);
                      if (userProfile != null) {
                        setState(() {
                          profiles.add(userProfile);
                        });
                      }
                    } catch (e) {
                      print('Error picking image from gallery: $e');
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<UserProfile?> _getUserProfileDetails(String imagePath) async {
    return showDialog<UserProfile>(
      context: context,
      builder: (context) {
        String name = '';
        String location = '';
        String bio = '';

        return AlertDialog(
          title: Text('Create Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Username'
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    location = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Address'
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    bio = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Bio'
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      UserProfile(
                        name: name,
                        imageUrl: imagePath,
                        location: location,
                        bio: bio,
                      ),
                    );
                  },
                  child: Text('Create Profile'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profiles'),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () { 
                Get.toNamed(Routes.HOMEPAGE);    
            },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Center(
      child: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 10
            ),
            leading: CircleAvatar(
              backgroundImage: FileImage(File(profiles[index].imageUrl)),
              radius: 40,
            ),
            title: Text(profiles[index].name),
            subtitle: Text(profiles[index].location),
            onTap: () {
            },
          );
        },
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProfile,
        tooltip: 'Add Profile',
        child: Icon(
          FontAwesomeIcons.plus,
          size: 25, 
          color: Colors.black 
          ),
          backgroundColor: Colors.grey[400],
      ),
      bottomNavigationBar: Navbar(currentIndex: 3),
    );
  }
}
