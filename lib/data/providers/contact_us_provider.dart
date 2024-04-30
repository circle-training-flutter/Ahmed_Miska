import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/data/models/body/contact_us_request_model.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/inti_model.dart';
import 'package:circletraning/data/repository/contact_us_repo.dart';
import 'package:circletraning/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUsProvider with ChangeNotifier {
  final ContactUsRepo contactUsRepo;

  ContactUsProvider({required this.contactUsRepo});
  bool isLoading = false;
  bool isFailure = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final subjectFormKey = GlobalKey<FormState>();
  final messageFormKey = GlobalKey<FormState>();
  final phone = saveUserData.getUserData()!.phone;

  InitModel? initModel;
  Future<ApiResponse> getContactUs(ContactUsRequestModel body) async {
    isLoading = true;
    notifyListeners();
    var response = await contactUsRepo.getContactUs(body);
    if (response.response != null && response.response?.statusCode == 200) {
      isLoading = false;
      initModel = InitModel.fromJson(response.response?.data);
      if (initModel != null && initModel?.code == 200) {
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
        pop();
      } else {
        Fluttertoast.showToast(msg: response.response?.data['message']);
      }
    } else {
      isFailure = true;
      Fluttertoast.showToast(msg: response.error);
    }
    isLoading = false;
    notifyListeners();
    return response;
  }
}
