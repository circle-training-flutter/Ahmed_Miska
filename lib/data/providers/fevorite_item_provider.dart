import 'package:circletraning/core/utils/show_toast.dart';
import 'package:flutter/material.dart';

import '../../core/errors/failures.dart';
import '../models/response/base/api_response.dart';
import '../models/response/product_model/product_datum.dart';
import '../models/response/product_model/product_model.dart';
import '../repository/fevorite_item_repo.dart';

class FevoriteItemProvider with ChangeNotifier {
  final List<ProductModelItem> fevoriteproductModelList = [];

  ServerFailure productfailure = ServerFailure('');

  final FevoriteItemRepo fevoriteItemRepo;
  ProductModel? productModel;

  bool isLoading = false;
  bool isFailure = false;

  FevoriteItemProvider(this.fevoriteItemRepo);

  Future<ApiResponse> getProducts(BuildContext context) async {
    fevoriteproductModelList.clear();
    notifyListeners();
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await fevoriteItemRepo.getFevoriteItem();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      productModel = ProductModel.fromJson(apiResponse.response!.data);
      if (productModel!.code == 200) {
        fevoriteproductModelList.addAll(productModel!.data!);
      } else {
        ToastUtils.showToast(productModel!.message!);
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
    int index = fevoriteproductModelList.indexWhere((product) => product.id == productId);
    if (index != -1) {
      fevoriteproductModelList[index].isFavorite = isFavorite;
      notifyListeners();
    }
  }
}
