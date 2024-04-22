class OrderCostRequestModel {
  num? latitude;
  num? longitude;
  List<Detail>? details;

  OrderCostRequestModel({
    this.latitude,
    this.longitude,
    this.details,
  });

  factory OrderCostRequestModel.fromJson(Map<String, dynamic> json) => OrderCostRequestModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  num? productId;
  num? qty;
  num? netCost;

  Detail({
    this.productId,
    this.qty,
    this.netCost,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        productId: json["product_id"],
        qty: json["qty"],
        netCost: json["net_cost"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "qty": qty,
        "net_cost": netCost,
      };
}
