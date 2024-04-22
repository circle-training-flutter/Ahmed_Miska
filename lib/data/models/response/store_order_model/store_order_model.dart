class StoreOrderModel {
  StoreOrderData? data;
  String? message;
  int? code;

  StoreOrderModel({
    this.data,
    this.message,
    this.code,
  });

  factory StoreOrderModel.fromJson(Map<String, dynamic> json) => StoreOrderModel(
        data: json["data"] == null ? null : StoreOrderData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "code": code,
      };
}

class StoreOrderData {
  int? id;
  int? userId;
  DataUser? user;
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
  num? pointsCount;
  num? pointsValue;
  num? driverId;
  dynamic driver;
  num? driverCost;
  num? netTotal;
  num? taxValue;
  num? deliveryPrice;
  num? grandTotal;
  dynamic notes;
  String? createdAt;
  DateTime? date;
  String? time;
  List<StoreOrderDetail>? details;

  StoreOrderData({
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

  factory StoreOrderData.fromJson(Map<String, dynamic> json) => StoreOrderData(
        id: json["id"],
        userId: json["user_id"],
        user: json["user"] == null ? null : DataUser.fromJson(json["user"]),
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
        pointsCount: json["points_count"],
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
        details: json["details"] == null ? [] : List<StoreOrderDetail>.from(json["details"]!.map((x) => StoreOrderDetail.fromJson(x))),
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

class StoreOrderDetail {
  int? id;
  int? productId;
  Product? product;
  num? qty;
  num? netCost;
  num? total;

  StoreOrderDetail({
    this.id,
    this.productId,
    this.product,
    this.qty,
    this.netCost,
    this.total,
  });

  factory StoreOrderDetail.fromJson(Map<String, dynamic> json) => StoreOrderDetail(
        id: json["id"],
        productId: json["product_id"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        qty: json["qty"]?.toDouble(),
        netCost: json["net_cost"],
        total: json["total"]?.toDouble(),
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

class Product {
  int? id;
  String? title;
  String? image;
  int? categoryId;
  Category? category;
  int? subCategoryId;
  Category? subCategory;
  String? details;
  dynamic salesLimit;
  num? price;
  String? unit;
  num? weightUnit;
  num? priceWeightUnit;
  bool? isOffer;
  int? isActive;
  dynamic offerType;
  num? offerValue;
  DateTime? offerStartDate;
  DateTime? offerEndDate;
  num? oldPrice;
  bool? isFavorite;

  Product({
    this.id,
    this.title,
    this.image,
    this.categoryId,
    this.category,
    this.subCategoryId,
    this.subCategory,
    this.details,
    this.salesLimit,
    this.price,
    this.unit,
    this.weightUnit,
    this.priceWeightUnit,
    this.isOffer,
    this.isActive,
    this.offerType,
    this.offerValue,
    this.offerStartDate,
    this.offerEndDate,
    this.oldPrice,
    this.isFavorite,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        categoryId: json["category_id"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        subCategoryId: json["sub_category_id"],
        subCategory: json["sub_category"] == null ? null : Category.fromJson(json["sub_category"]),
        details: json["details"],
        salesLimit: json["sales_limit"],
        price: json["price"],
        unit: json["unit"],
        weightUnit: json["weight_unit"],
        priceWeightUnit: json["price_weight_unit"],
        isOffer: json["is_offer"],
        isActive: json["is_active"],
        offerType: json["offer_type"],
        offerValue: json["offer_value"],
        offerStartDate: json["offer_start_date"] == null ? null : DateTime.parse(json["offer_start_date"]),
        offerEndDate: json["offer_end_date"] == null ? null : DateTime.parse(json["offer_end_date"]),
        oldPrice: json["old_price"],
        isFavorite: json["is_favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "category_id": categoryId,
        "category": category?.toJson(),
        "sub_category_id": subCategoryId,
        "sub_category": subCategory?.toJson(),
        "details": details,
        "sales_limit": salesLimit,
        "price": price,
        "unit": unit,
        "weight_unit": weightUnit,
        "price_weight_unit": priceWeightUnit,
        "is_offer": isOffer,
        "is_active": isActive,
        "offer_type": offerType,
        "offer_value": offerValue,
        "offer_start_date": "${offerStartDate!.year.toString().padLeft(4, '0')}-${offerStartDate!.month.toString().padLeft(2, '0')}-${offerStartDate!.day.toString().padLeft(2, '0')}",
        "offer_end_date": "${offerEndDate!.year.toString().padLeft(4, '0')}-${offerEndDate!.month.toString().padLeft(2, '0')}-${offerEndDate!.day.toString().padLeft(2, '0')}",
        "old_price": oldPrice,
        "is_favorite": isFavorite,
      };
}

class Category {
  int? id;
  String? image;
  String? title;
  List<Category>? subCategories;
  DateTime? createdAt;

  Category({
    this.id,
    this.image,
    this.title,
    this.subCategories,
    this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        subCategories: json["sub_categories"] == null ? [] : List<Category>.from(json["sub_categories"]!.map((x) => Category.fromJson(x))),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
      };
}

class DataUser {
  UserUser? user;

  DataUser({
    this.user,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        user: json["user"] == null ? null : UserUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class UserUser {
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

  UserUser({
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

  factory UserUser.fromJson(Map<String, dynamic> json) => UserUser(
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
