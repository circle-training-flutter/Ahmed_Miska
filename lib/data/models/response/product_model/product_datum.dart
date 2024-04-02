import 'package:equatable/equatable.dart';

import 'category.dart';
import 'sub_category.dart';

// ignore: must_be_immutable
class ProductModelItem extends Equatable {
  final int? id;
  final String? title;
  final String? image;
  final int? categoryId;
  final Category? category;
  final int? subCategoryId;
  final SubCategory? subCategory;
  final String? details;
  final dynamic salesLimit;
  final dynamic price;
  final String? unit;
  dynamic weightUnit;
  final dynamic priceWeightUnit;
  final bool? isOffer;
  final int? isActive;
  final dynamic offerType;
  final int? offerValue;
  final String? offerStartDate;
  final String? offerEndDate;
  final dynamic oldPrice;
  final bool? isFavorite;

  ProductModelItem({
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

  factory ProductModelItem.fromJson(Map<String, dynamic> json) =>
      ProductModelItem(
        id: json['id'] as int?,
        title: json['title'] as String?,
        image: json['image'] as String?,
        categoryId: json['category_id'] as int?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        subCategoryId: json['sub_category_id'] as int?,
        subCategory: json['sub_category'] == null
            ? null
            : SubCategory.fromJson(
                json['sub_category'] as Map<String, dynamic>),
        details: json['details'] as String?,
        salesLimit: json['sales_limit'] as dynamic,
        price: json['price'] is double?
            ? json['price'] as double
            : json['price'] as int,
        unit: json['unit'] as String?,
        weightUnit: json['weight_unit'] is double?
            ? json['weight_unit'] as double
            : json['weight_unit'] as int, // Keep double as it is
        priceWeightUnit: json['price_weight_unit'] is double?
            ? json['price_weight_unit'] as double
            : json['price_weight_unit'] as int,
        isOffer: json['is_offer'] as bool?,
        isActive: json['is_active'] as int?,
        offerType: json['offer_type'] as dynamic,
        offerValue: json['offer_value'] as int?,
        offerStartDate: json['offer_start_date'] as String?,
        offerEndDate: json['offer_end_date'] as String?,
        oldPrice: json['old_price'] is double?
            ? json['old_price'] as double
            : json['old_price'] as int,
        isFavorite: json['is_favorite'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'category_id': categoryId,
        'category': category?.toJson(),
        'sub_category_id': subCategoryId,
        'sub_category': subCategory?.toJson(),
        'details': details,
        'sales_limit': salesLimit,
        'price': price,
        'unit': unit,
        'weight_unit': weightUnit,
        'price_weight_unit': priceWeightUnit,
        'is_offer': isOffer,
        'is_active': isActive,
        'offer_type': offerType,
        'offer_value': offerValue,
        'offer_start_date': offerStartDate,
        'offer_end_date': offerEndDate,
        'old_price': oldPrice,
        'is_favorite': isFavorite,
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      image,
      categoryId,
      category,
      subCategoryId,
      subCategory,
      details,
      salesLimit,
      price,
      unit,
      weightUnit,
      priceWeightUnit,
      isOffer,
      isActive,
      offerType,
      offerValue,
      offerStartDate,
      offerEndDate,
      oldPrice,
      isFavorite,
    ];
  }
}
