import 'package:circletraning/data/models/response/inti_model.dart';
import 'package:circletraning/data/repository/add_and_remove_favorites_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/response/base/api_response.dart';

class AddAndRemoveFavoritesProvider with ChangeNotifier {
  final AddAndRemoveFavoritesRepo addAndRemoveFavoritesRepo;

  AddAndRemoveFavoritesProvider(
    this.addAndRemoveFavoritesRepo,
  );

  InitModel? initModel;

  ///variables
  bool isLoading = false;

  ///calling APIs Functions
  Future<ApiResponse> addAndRemoveFavorite(int productID) async {
    isLoading = true;
    notifyListeners();

    var responseModel = await addAndRemoveFavoritesRepo.addAndRemoveFavoritesRepo(productID);

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      isLoading = false;
      initModel = InitModel.fromJson(responseModel.response?.data);
    } else {
      isLoading = false;
      Fluttertoast.showToast(msg: responseModel.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
