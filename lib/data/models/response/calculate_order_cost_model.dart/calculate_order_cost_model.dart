class OrderCostModel {
  OrderCostData? data;
  String? message;
  int? code;

  OrderCostModel({
    this.data,
    this.message,
    this.code,
  });

  factory OrderCostModel.fromJson(Map<String, dynamic> json) => OrderCostModel(
        data: json["data"] == null ? null : OrderCostData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "code": code,
      };
}
class OrderCostData {
  num? points;
  num? willDiscPoints;
  num? totalPoints;
  num? netTotal;
  num? taxValue;
  num? totalTax;
  num? grandTotalWithoutDriverCost;
  num? deliveryPrice;
  num? grandTotal;

  OrderCostData({
    this.points,
    this.willDiscPoints,
    this.totalPoints,
    this.netTotal,
    this.taxValue,
    this.totalTax,
    this.grandTotalWithoutDriverCost,
    this.deliveryPrice,
    this.grandTotal,
  });

  factory OrderCostData.fromJson(Map<String, dynamic> json) => OrderCostData(
        points: json["points"],
        willDiscPoints: json["will_disc_points"],
        totalPoints: json["total_points"],
        netTotal: json["net_total"],
        taxValue: json["tax_value"],
        totalTax: json["total_tax"],
        grandTotalWithoutDriverCost: json["grand_total_without_driver_cost"],
        deliveryPrice: json["delivery_price"],
        grandTotal: json["grand_total"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
        "will_disc_points": willDiscPoints,
        "total_points": totalPoints,
        "net_total": netTotal,
        "tax_value": taxValue,
        "total_tax": totalTax,
        "grand_total_without_driver_cost": grandTotalWithoutDriverCost,
        "delivery_price": deliveryPrice,
        "grand_total": grandTotal,
      };
}


