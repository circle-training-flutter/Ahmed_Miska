// Remove the existing import statement
// import 'package:circletraning/data/models/body/calculate_order_cost_request_model.dart';

import 'package:circletraning/data/models/body/calculate_order_cost_request_model.dart';

class StoreOrderRequestModel {
  String? address;
  int? delivery;
  num? latitude;
  num? longitude;
  dynamic notes;
  String? payType;
  num? netTotal;
  num? driverCost;
  bool? isPoints;
  num? pointsCount;
  num? pointsValue;
  num? taxValue;
  num? grandTotal;
  List<Detail>? details;

  StoreOrderRequestModel({
    this.address,
    this.delivery,
    this.latitude,
    this.longitude,
    this.notes,
    this.payType,
    this.netTotal,
    this.driverCost,
    this.isPoints,
    this.pointsCount,
    this.pointsValue,
    this.taxValue,
    this.grandTotal,
    this.details,
  });

  factory StoreOrderRequestModel.fromJson(Map<String, dynamic> json) => StoreOrderRequestModel(
        address: json["address"],
        delivery: json["delivery"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        notes: json["notes"],
        payType: json["pay_type"],
        netTotal: json["net_total"],
        driverCost: json["driver_cost"],
        isPoints: json["is_points"],
        pointsCount: json["points_count"],
        pointsValue: json["points_value"],
        taxValue: json["tax_value"]?.toDouble(),
        grandTotal: json["grand_total"]?.toDouble(),
        details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "delivery": delivery,
        "latitude": latitude,
        "longitude": longitude,
        "notes": notes,
        "pay_type": payType,
        "net_total": netTotal,
        "driver_cost": driverCost,
        "is_points": isPoints,
        "points_count": pointsCount,
        "points_value": pointsValue,
        "tax_value": taxValue,
        "grand_total": grandTotal,
        "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}
