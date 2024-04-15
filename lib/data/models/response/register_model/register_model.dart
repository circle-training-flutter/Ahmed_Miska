
// import 'package:circletraning/data/models/response/login_model/login_model.dart';

// class RegisterBody {
//     LoginData? data;
//     String? message;
//     int? code;

//     RegisterBody({
//         this.data,
//         this.message,
//         this.code,
//     });

//     factory RegisterBody.fromJson(Map<String, dynamic> json) => RegisterBody(
//         data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
//         message: json["message"],
//         code: json["code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//         "message": message,
//         "code": code,
//     };
// }

// class RegisterData {
//     UserData? user;
//     Auth? auth;

//     RegisterData({
//         this.user,
//         this.auth,
//     });

//     factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
//         user: json["user"] == null ? null : UserData.fromJson(json["user"]),
//         auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "user": user?.toJson(),
//         "auth": auth?.toJson(),
//     };
// }



// class User {
//     int? id;
//     String? firstName;
//     String? lastName;
//     String? phoneCode;
//     String? phone;
//     String? image;
//     int? points;
//     String? invitationCode;
//     int? cityId;
//     City? city;

//     User({
//         this.id,
//         this.firstName,
//         this.lastName,
//         this.phoneCode,
//         this.phone,
//         this.image,
//         this.points,
//         this.invitationCode,
//         this.cityId,
//         this.city,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         phoneCode: json["phone_code"],
//         phone: json["phone"],
//         image: json["image"],
//         points: json["points"],
//         invitationCode: json["invitation_code"],
//         cityId: json["city_id"],
//         city: json["city"] == null ? null : City.fromJson(json["city"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "first_name": firstName,
//         "last_name": lastName,
//         "phone_code": phoneCode,
//         "phone": phone,
//         "image": image,
//         "points": points,
//         "invitation_code": invitationCode,
//         "city_id": cityId,
//         "city": city?.toJson(),
//     };
// }

