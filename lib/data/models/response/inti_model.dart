

class InitModel {
    dynamic data;
    String? message;
    int? code;

    InitModel({
        this.data,
        this.message,
        this.code,
    });

    factory InitModel.fromJson(Map<String, dynamic> json) => InitModel(
        data: json["data"],
        message: json["message"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "code": code,
    };
}