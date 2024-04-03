

class CityModel {
    List<CityDatum>? data;
    String? message;
    int? code;

    CityModel({
        this.data,
        this.message,
        this.code,
    });

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        data: json["data"] == null ? [] : List<CityDatum>.from(json["data"]!.map((x) => CityDatum.fromJson(x))),
        message: json["message"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "code": code,
    };
}

class CityDatum {
    int? id;
    String? title;
    int? deliveryCost;
    int? regionId;

    CityDatum({
        this.id,
        this.title,
        this.deliveryCost,
        this.regionId,
    });

    factory CityDatum.fromJson(Map<String, dynamic> json) => CityDatum(
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
