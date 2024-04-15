import 'package:circletraning/features/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/helpers/extentions.dart';
import '../models/body/register_request_model.dart';
import '../models/response/auth_model/auth_model.dart';
import '../models/response/base/api_response.dart';
import '../repository/register_repo.dart';
import '../repository/save_user_data.dart';

class RegisterProvider with ChangeNotifier {
  final RegisterRepo registerRepo;
  final SaveUserData saveUserData;

  RegisterProvider(
    this.saveUserData, {
    required this.registerRepo,
  });

  /// register TextEditingController
  TextEditingController phoneController = TextEditingController();
  // var phoneController = Provider.of<LoginProvider>(context as BuildContext, listen: false).phoneController;
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
  AuthModel? _registerBody;

  ///getters
  bool get isLoading => _isLoading;
  AuthModel? get registerBody => _registerBody;

  ///calling APIs Functions
  Future<ApiResponse> regiter(RegisterRequestBody body) async {
    _isLoading = true;
    notifyListeners();

    var responseModel = await registerRepo.register(body);

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _registerBody = AuthModel.fromJson(responseModel.response?.data);
      if (_registerBody != null && _registerBody?.code == 200) {
        saveUserData.saveUserData(_registerBody!);
        saveUserData.saveUserToken(_registerBody?.data?.auth?.token ?? '');
        phoneController.clear();
        firstNameController.clear();
        lastNameController.clear();
        inviteCodeController.clear();
        cityId = 0;
        pushAndRemoveUntil(const MainScreen());
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
