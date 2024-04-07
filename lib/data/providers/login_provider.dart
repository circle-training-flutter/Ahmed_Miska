import 'package:circletraning/data/models/body/login_request_model.dart';
import 'package:circletraning/data/repository/login_repo.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/helpers/extentions.dart';
import '../models/response/base/api_response.dart';
import '../models/response/login_model/login_model.dart';
import '../repository/save_user_data.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepo loginRepo;
  final SaveUserData saveUserData;

  LoginProvider({
    required this.loginRepo,
    required this.saveUserData,
  });

  /// login TextEditingController
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ///variables
  bool _isLoading = false;
  LoginBody? _loginBody;

  ///getters
  bool get isLoading => _isLoading;
  LoginBody? get loginBody => _loginBody;

  ///calling APIs Functions
  Future<ApiResponse> login(LoginRequestBody body) async {
    _isLoading = true;
    notifyListeners();

    var responseModel = await loginRepo.login(body);

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _loginBody = LoginBody.fromJson(responseModel.response?.data);
      if (_loginBody != null && _loginBody?.code == 200) {
        if (_loginBody?.data?.user!.id != null) {
          saveUserData.saveUserData(_loginBody!);
          saveUserData.saveUserToken(_loginBody?.data?.auth?.token ?? '');
          phoneController.text = '';
          pushAndRemoveUntil(const MainScreen());
          // pushAndRemoveUntil(const BottomNavigationBarApp());
          // await authRepo.updateFCMToken();
        }
      } else if (_loginBody?.code == 422) {
        Fluttertoast.showToast(msg: responseModel.response?.data['message']);
        // push(const CreateAndEditAccount(
        //   isEdit: false,
        // ));
      }
    } else {
      _isLoading = false;
      Fluttertoast.showToast(msg: responseModel.error);
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
