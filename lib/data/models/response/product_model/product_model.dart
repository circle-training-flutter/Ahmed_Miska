import 'package:equatable/equatable.dart';

import 'product_datum.dart';

class ProductModel extends Equatable {
  final List<ProductModelItem>? data;
  final String? message;
  final int? code;

  const ProductModel({this.data, this.message, this.code});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ProductModelItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
        'code': code,
      };

  @override
  List<Object?> get props => [data, message, code];
}
