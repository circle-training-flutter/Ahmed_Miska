import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/data/models/body/update_profile_request_mpdel.dart';
import 'package:circletraning/data/models/response/auth_model/auth_model.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/providers/register_provider.dart';
import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:circletraning/data/repository/update_profile_repo.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateProfileProvider with ChangeNotifier {
  final UpdateProfileRepo updateProfileRepo;
  final SaveUserData saveUserData;
  RegisterProvider registerProvider = getIt();

  UpdateProfileProvider({required this.updateProfileRepo, required this.saveUserData});

  bool isLoading = false;
  bool isFailure = true;
  AuthModel? loginBody;

  Future<ApiResponse> updateProfile(UpdateProfileRequestModel model) async {
    isLoading = true;
    notifyListeners();
    var responseModel = await updateProfileRepo.updateProfile(model);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      isLoading = false;
      loginBody = AuthModel.fromJson(responseModel.response?.data);
      if (loginBody != null && loginBody?.code == 200) {
        saveUserData.saveUserData(loginBody!);
        saveUserData.saveUserToken(loginBody?.data?.auth?.token ?? '');
        registerProvider.firstNameController.text = '';
        registerProvider.lastNameController.text = '';
        notifyListeners();
        pushAndRemoveUntil(const MainScreen());
      } else if (loginBody?.code == 422) {
        Fluttertoast.showToast(msg: responseModel.response?.data['message']);
      }
    } else {
      isLoading = false;
      Fluttertoast.showToast(msg: responseModel.error);
      notifyListeners();
    }
    isLoading = false;
    return responseModel;
  }
}
