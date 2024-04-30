import 'dart:io';

class UpdateProfileRequestModel {
  final String firstName;
  final String lastName;
  final File? image;

  UpdateProfileRequestModel(this.image, {required this.firstName,required this.lastName});

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
      };
}
