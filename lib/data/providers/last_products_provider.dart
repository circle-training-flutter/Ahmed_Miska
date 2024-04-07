import 'package:circletraning/core/errors/failures.dart';
import 'package:circletraning/data/models/response/product_model/product_datum.dart';
import 'package:circletraning/data/models/response/product_model/product_model.dart';
import 'package:flutter/material.dart';
import '../models/response/base/api_response.dart';
import '../repository/last_products_repo.dart';

class LastProductsProvider with ChangeNotifier {
  final List<ProductModelItem> productModelList = [];

  late final ServerFailure productfailure;

  final LastProductsRepo lastProductsRepo;
  ProductModel? productModel;

  LastProductsProvider(this.lastProductsRepo);

  bool isLoading = false;
  bool isFailure = false;

  Future<ApiResponse> getProducts() async {
    productModelList.clear();
    notifyListeners();
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await lastProductsRepo.getProducts();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      productModel = ProductModel.fromJson(apiResponse.response!.data);
      if (productModel!.code == 200) {
        productModelList.addAll(productModel!.data!);
      } else {
        // ignore: use_build_context_synchronously
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(productModel?.message ?? ""),
        //   backgroundColor: Colors.red,
        // ));
      }
    } else {
      isFailure = true;
      productfailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }

  // Future<void> getProducts() async {
  //   isloadingProduct = true;
  //   notifyListeners();
  //   var data = await lastProductsRepo.getProducts();
  //   data.fold((failure) {
  //     productfailure = ServerFailure(failure.errMessage);
  //     isloadingProduct = false;
  //     isProductFailure = true;

  //     notifyListeners();
  //   }, (product) {
  //     productModelList.addAll(product);
  //     isloadingProduct = false;
  //     notifyListeners();
  //   });
  // }
}
