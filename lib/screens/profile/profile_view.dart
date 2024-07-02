import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/profile/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileController _controller;
  bool _isLoading = true;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = ProfileController();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    await _controller.loadProfileData();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                _controller.saveProfileData();
              }
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: _controller.profile.image != null
                    ? FileImage(_controller.profile.image!)
                    : NetworkImage('https://picsum.photos/200'),
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileField(
                'First Name', _controller.profile.firstname, (value) => _controller.profile.firstname = value),
            const SizedBox(height: 10),
            _buildProfileField(
                'Last Name', _controller.profile.lastname, (value) => _controller.profile.lastname = value),
            const SizedBox(height: 10),
            _buildProfileField(
                'Email', _controller.profile.email, (value) => _controller.profile.email = value),
            const SizedBox(height: 10),
            _buildProfileField(
                'Gender', _controller.profile.gender, (value) => _controller.profile.gender = value),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _isEditing
            ? TextField(
          onChanged: onChanged,
          controller: TextEditingController(text: value),
          decoration: InputDecoration(border: OutlineInputBorder()),
        )
            : Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
