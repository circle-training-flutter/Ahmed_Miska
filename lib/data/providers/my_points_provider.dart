import 'package:circletraning/core/errors/failures.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/my_points_model/my_points_model.dart';
import 'package:circletraning/data/repository/my_points_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPointsProvider with ChangeNotifier {
  final List<History> myPointsList = [];
  ServerFailure productfailure;
  final MyPointsRepo myPointsRepo;
  MyPointsModel? myPointsModel;
  MyPointsProvider({required this.myPointsRepo, required this.productfailure});

  bool isLoading = false;
  bool isFailure = false;
  Future<ApiResponse> getMyPoints() async {
    isLoading = true;
    notifyListeners();
    myPointsList.clear();
    ApiResponse apiResponse = await myPointsRepo.getMyPoints();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      myPointsModel = MyPointsModel.fromJson(apiResponse.response!.data);
      if (myPointsModel!.code == 200) {
        myPointsList.addAll(myPointsModel!.data!.history!);
      } else {
        Fluttertoast.showToast(msg: myPointsModel!.message!);
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
