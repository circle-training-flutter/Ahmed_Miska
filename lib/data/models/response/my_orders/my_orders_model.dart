import 'package:circletraning/data/models/response/auth_model/auth_model.dart';
import 'package:circletraning/data/models/response/product_model/product_datum.dart';

class MyOrdersModel {
  List<MyOrdersData>? data;
  String? message;
  int? code;

  MyOrdersModel({
    this.data,
    this.message,
    this.code,
  });

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) => MyOrdersModel(
        data: json["data"] == null ? [] : List<MyOrdersData>.from(json["data"]!.map((x) => MyOrdersData.fromJson(x))),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "code": code,
      };
}

class MyOrdersData {
  int? id;
  int? userId;
  UserData? user;
  dynamic driverCancelReason;
  String? address;
  dynamic addressDetails;
  num? latitude;
  num? longitude;
  String? status;
  bool? isCollected;
  String? payType;
  bool? isPaid;
  bool? isPoints;
  double? pointsCount;
  int? pointsValue;
  int? driverId;
  dynamic driver;
  num? driverCost;
  num? netTotal;
  num? taxValue;
  num? deliveryPrice;
  num? grandTotal;
  String? notes;
  String? createdAt;
  DateTime? date;
  String? time;
  List<Detail>? details;

  MyOrdersData({
    this.id,
    this.userId,
    this.user,
    this.driverCancelReason,
    this.address,
    this.addressDetails,
    this.latitude,
    this.longitude,
    this.status,
    this.isCollected,
    this.payType,
    this.isPaid,
    this.isPoints,
    this.pointsCount,
    this.pointsValue,
    this.driverId,
    this.driver,
    this.driverCost,
    this.netTotal,
    this.taxValue,
    this.deliveryPrice,
    this.grandTotal,
    this.notes,
    this.createdAt,
    this.date,
    this.time,
    this.details,
  });

  factory MyOrdersData.fromJson(Map<String, dynamic> json) => MyOrdersData(
        id: json["id"],
        userId: json["user_id"],
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
        driverCancelReason: json["driver_cancel_reason"],
        address: json["address"],
        addressDetails: json["address_details"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        status: json["status"],
        isCollected: json["is_collected"],
        payType: json["pay_type"],
        isPaid: json["is_paid"],
        isPoints: json["is_points"],
        pointsCount: json["points_count"]?.toDouble(),
        pointsValue: json["points_value"],
        driverId: json["driver_id"],
        driver: json["driver"],
        driverCost: json["driver_cost"],
        netTotal: json["net_total"],
        taxValue: json["tax_value"]?.toDouble(),
        deliveryPrice: json["delivery_price"],
        grandTotal: json["grand_total"]?.toDouble(),
        notes: json["notes"],
        createdAt: json["created_at"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user": user?.toJson(),
        "driver_cancel_reason": driverCancelReason,
        "address": address,
        "address_details": addressDetails,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
        "is_collected": isCollected,
        "pay_type": payType,
        "is_paid": isPaid,
        "is_points": isPoints,
        "points_count": pointsCount,
        "points_value": pointsValue,
        "driver_id": driverId,
        "driver": driver,
        "driver_cost": driverCost,
        "net_total": netTotal,
        "tax_value": taxValue,
        "delivery_price": deliveryPrice,
        "grand_total": grandTotal,
        "notes": notes,
        "created_at": createdAt,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  int? id;
  int? productId;
  ProductModelItem? product;
  num? qty;
  num? netCost;
  num? total;

  Detail({
    this.id,
    this.productId,
    this.product,
    this.qty,
    this.netCost,
    this.total,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        productId: json["product_id"],
        product: json["product"] == null ? null : ProductModelItem.fromJson(json["product"]),
        qty: json["qty"],
        netCost: json["net_cost"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product": product?.toJson(),
        "qty": qty,
        "net_cost": netCost,
        "total": total,
      };
}
