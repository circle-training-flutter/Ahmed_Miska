class AuthModel {
  AuthData? data;
  String? message;
  int? code;

  AuthModel({
    this.data,
    this.message,
    this.code,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        data: json["data"] == null ? null : AuthData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "code": code,
      };
}

class AuthData {
  UserData? user;
  Auth? auth;

  AuthData({
    this.user,
    this.auth,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "auth": auth?.toJson(),
      };
}

class Auth {
  String? token;

  Auth({
    this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phone;
  String? image;
  num? points;
  String? invitationCode;
  int? cityId;
  City? city;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
    this.points,
    this.invitationCode,
    this.cityId,
    this.city,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneCode: json["phone_code"],
        phone: json["phone"],
        image: json["image"],
        points: json["points"],
        invitationCode: json["invitation_code"],
        cityId: json["city_id"],
        city: json["city"] == null ? null : City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone_code": phoneCode,
        "phone": phone,
        "image": image,
        "points": points,
        "invitation_code": invitationCode,
        "city_id": cityId,
        "city": city?.toJson(),
      };
}

class City {
  int? id;
  String? title;
  num? deliveryCost;
  int? regionId;

  City({
    this.id,
    this.title,
    this.deliveryCost,
    this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        title: json["title"],
        deliveryCost: json["delivery_cost"],
        regionId: json["region_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "delivery_cost": deliveryCost,
        "region_id": regionId,
      };
}
