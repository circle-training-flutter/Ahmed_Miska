import 'package:circletraning/data/models/response/sub_category_model/sub_cat_item.dart';
import 'package:flutter/material.dart';

import '../../core/errors/failures.dart';
import '../models/response/base/api_response.dart';

import '../models/response/sub_category_model/sub_category_model.dart';
import '../repository/sup_category_repo.dart';

class SubCategoryProvider with ChangeNotifier {
  final List<SubCategoryItem> subCategoryList = [];
  final SupCategoryRepo supCategoryRepo;
  bool isloading = false;
  bool isFailure = false;
  late final ServerFailure subCatfailure;
  SubCategoryModel? subCategoryModel;

  SubCategoryProvider(this.supCategoryRepo);

  Future<ApiResponse> getsubCategory(BuildContext context, int id) async {
    isloading = true;
    notifyListeners();
    subCategoryList.clear();
    notifyListeners();
    ApiResponse apiResponse = await supCategoryRepo.getSubCategory(id);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      subCategoryModel = SubCategoryModel.fromJson(apiResponse.response!.data);
      if (subCategoryModel!.code == 200) {
        subCategoryList.addAll(subCategoryModel!.data!);
        notifyListeners();
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(subCategoryModel?.message ?? ""),
          backgroundColor: Colors.red,
        ));
      }
    } else {
      isFailure = true;
      subCatfailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isloading = false;
    notifyListeners();
    return apiResponse;
  }

  // Future<void> getsubCategory(int id) async {
  //   subCategoryList.clear();
  //   isloadingSubCat = true;
  //   notifyListeners();
  //   var data = await supCategoryRepo.getSubCategory(id);
  //   data.fold((failure) {
  //     subCatfailure = ServerFailure(failure.errMessage);
  //     isloadingSubCat = false;
  //     isloadingSupFailure = true;
  //     notifyListeners();
  //   }, (category) {
  //     subCategoryList.addAll(category);
  //     isloadingSubCat = false;
  //     notifyListeners();
  //   });
  // }
}
