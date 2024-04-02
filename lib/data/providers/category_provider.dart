import 'package:circletraning/data/models/response/category_model/cat_item.dart';
import 'package:flutter/material.dart';

import '../../core/errors/failures.dart';
import '../models/response/base/api_response.dart';
import '../models/response/category_model/category_model.dart';
import '../repository/category_repo.dart';

class CategoryProvider with ChangeNotifier {
  final List<CatItem> categoryModelList = [];
  late final ServerFailure catfailure;
  final CategoryRepo categoryRepo;
  CategoryModel? categoryModel;

  CategoryProvider(this.categoryRepo);
  bool isloading = false;
  bool isFailure = false;

  Future<ApiResponse> getCategoryy(BuildContext context) async {
    isloading = true;
    notifyListeners();
    ApiResponse apiResponse = await categoryRepo.getCategoryy();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      categoryModel = CategoryModel.fromJson(apiResponse.response!.data);
      if (categoryModel!.code == 200) {
        categoryModelList.addAll(categoryModel!.data!);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(categoryModel?.message ?? ""),
          backgroundColor: Colors.red,
        ));
      }
    } else {
      isFailure = true;
      catfailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isloading = false;
    notifyListeners();
    return apiResponse;
  }

  // Future<void> getCategory() async {
  //   isloading = true;
  //   notifyListeners();
  //   var data = await categoryRepo.getCategory();
  //   data.fold((failure) {
  //     catfailure = ServerFailure(failure.errMessage);
  //     isloading = false;
  //     isFailure = true;
  //     notifyListeners();
  //   }, (category) {
  //     categoryModelList.addAll(category);
  //     isloading = false;
  //     notifyListeners();
  //   });
  // }
}
