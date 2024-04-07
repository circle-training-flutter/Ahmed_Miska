import 'dart:io';

class RegisterRequestBody {
  final String firstName;
  final String lastName;
  final String phoneCode = '+20';
  final String phone;
  final File? image;
  final String? invitationCode;
  final int cityId;

  RegisterRequestBody({
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.image,
    this.invitationCode,
    required this.cityId,
  });

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone_code": phoneCode,
        "phone": phone,
        "image": image,
        "invitation_code": invitationCode,
        "city_id": cityId,
      };
}
