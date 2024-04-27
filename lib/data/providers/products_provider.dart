import 'package:circletraning/core/errors/failures.dart';

import 'package:circletraning/data/repository/products_repo.dart';
import 'package:flutter/material.dart';
import '../models/response/base/api_response.dart';
import '../models/response/product_model/product_datum.dart';
import '../models/response/products_model/products_model.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModelItem> productModelList = [];

  late final ServerFailure productfailure;

  final ProductsRepo productsRepo;
  ProductsModel? productModel;

  ProductProvider(this.productsRepo);

  bool isLoading = false;
  bool isFailure = false;

  Future<ApiResponse> getProducts(BuildContext context, {Map<String, dynamic>? query}) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await productsRepo.getProduct(query: query);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      productModel = ProductsModel.fromJson(apiResponse.response!.data!);
      if (productModel!.code == 200) {
        productModelList.clear();

        productModelList.addAll(productModel!.data!);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(productModel?.message ?? ""),
          backgroundColor: Colors.red,
        ));
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

  void updateFavoriteStatus(int productId, bool isFavorite) {
    int index = productModelList.indexWhere((product) => product.id == productId);
    if (index != -1) {
      productModelList[index].isFavorite = isFavorite;
      notifyListeners();
    }
  }
}
