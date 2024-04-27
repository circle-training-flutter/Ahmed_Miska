import 'package:circletraning/core/errors/failures.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/my_orders/my_orders_model.dart';
import 'package:circletraning/data/repository/my_orders_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyOrdersProvider extends ChangeNotifier {
  final List<MyOrdersData> myOrdersModelList = [];
  late final ServerFailure productfailure;
  final MyOrdersRepo myOrdersRepo;
  MyOrdersModel? myOrdersModel;

  MyOrdersProvider({required this.myOrdersRepo});

  bool isLoading = false;
  bool isFailure = false;
  Future<ApiResponse> getMyOrders(BuildContext context, {Map<String, dynamic>? query}) async {
    myOrdersModelList.clear();
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await myOrdersRepo.getOrdrs(query: query);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      myOrdersModel = MyOrdersModel.fromJson(apiResponse.response!.data!);
      if (myOrdersModel!.code == 200) {
        myOrdersModelList.clear();
        myOrdersModelList.addAll(myOrdersModel!.data!);
      } else {
        Fluttertoast.showToast(msg: myOrdersModel!.message!);
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
}
