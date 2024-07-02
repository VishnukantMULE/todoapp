import 'dart:io';

class ProfileModel {
  String firstname = '';
  String lastname = '';
  String email = '';
  String gender = '';
  File? image;

  ProfileModel({
    this.firstname = '',
    this.lastname = '',
    this.email = '',
    this.gender = '',
    this.image,
  });
}
