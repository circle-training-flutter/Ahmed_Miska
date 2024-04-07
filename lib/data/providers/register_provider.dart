import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/helpers/extentions.dart';
import '../models/body/register_request_model.dart';
import '../models/response/base/api_response.dart';
import '../models/response/register_model/register_model.dart';
import '../repository/register_repo.dart';

class RegisterProvider with ChangeNotifier {
  final RegisterRepo registerRepo;

  RegisterProvider({
    required this.registerRepo,
  });

  /// register TextEditingController
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController inviteCodeController = TextEditingController();
  final firstNameFormKey = GlobalKey<FormState>();
  final lastNameFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final cityFromKey = GlobalKey<FormState>();
  int? cityId;

  ///variables
  bool _isLoading = false;
  RegisterBody? _registerBody;

  ///getters
  bool get isLoading => _isLoading;
  RegisterBody? get registerBody => _registerBody;

  ///calling APIs Functions
  Future<ApiResponse> regiter(RegisterRequestBody body) async {
    _isLoading = true;
    notifyListeners();

    var responseModel = await registerRepo.register(body);

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _registerBody = RegisterBody.fromJson(responseModel.response?.data);
      if (_registerBody != null && _registerBody?.code == 200) {
        phoneController.clear();
        firstNameController.clear();
        lastNameController.clear();
        inviteCodeController.clear();
        cityId = 0;
        pop();
      } else if (_registerBody?.code == 422) {
        Fluttertoast.showToast(msg: responseModel.response?.data['message']);
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
