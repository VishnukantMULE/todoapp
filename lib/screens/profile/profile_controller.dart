import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/screens/profile/profile_model.dart';

class ProfileController {
  late ProfileModel profile;

  ProfileController() {
    profile = ProfileModel();
  }

  Future<void> loadProfileData() async {
    final box = GetStorage();
    profile.firstname = box.read('firstname') ?? '';
    profile.lastname = box.read('lastname') ?? '';
    profile.email = box.read('email') ?? '';
    profile.gender = box.read('gender') ?? '';

    String? imagePath = box.read('imagePath');
    if (imagePath != null) {
      profile.image = File(imagePath);
    }

    // Print loaded profile data for debugging
    print('Profile loaded: ${profile.firstname}, ${profile.lastname}, ${profile.email}, ${profile.gender}');
  }

  Future<void> saveProfileData() async {
    final box = GetStorage();
    await box.write('firstname', profile.firstname);
    await box.write('lastname', profile.lastname);
    await box.write('email', profile.email);
    await box.write('gender', profile.gender);

    if (profile.image != null) {
      await box.write('imagePath', profile.image!.path);
    }

    // Print saved profile data for debugging
    print('Profile saved: ${profile.firstname}, ${profile.lastname}, ${profile.email}, ${profile.gender}');
  }
}
