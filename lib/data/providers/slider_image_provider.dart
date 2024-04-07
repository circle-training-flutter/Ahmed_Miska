import 'package:flutter/material.dart';

import '../../core/errors/failures.dart';
import '../models/response/base/api_response.dart';

import '../models/response/slider_model/s_slider_model.dart';
import '../models/response/slider_model/slider.dart';
import '../repository/slider_repo.dart';

class SliderImageProvider with ChangeNotifier {
  final List<Sslider>? sSliderList = [];
  final SliderRepo sliderRepo;
  late final ServerFailure sliderfailure;

  SliderModel? sliderModel;

  SliderImageProvider(this.sliderRepo);
  bool isloadingSlider = false;
  bool isSliderFailure = false;
  int notificationCount = 0;

  SliderModel get sliderModelDatad => sliderModel!;

  Future<ApiResponse> sliderHomeRepo() async {
    isloadingSlider = true;
    notifyListeners();
    ApiResponse apiResponse = await sliderRepo.sliderHomeRepo();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      sliderModel = SliderModel.fromJson(apiResponse.response!.data);
      if (sliderModel!.code == 200) {
        notificationCount = sliderModel!.data!.notificationCount!;
        sSliderList!.addAll(sliderModel!.data!.slider!);
      } else {
        // ignore: use_build_context_synchronously
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(sliderModel?.message ?? ""),
        //   backgroundColor: Colors.red,
        // ));
      }
    } else {
      isSliderFailure = true;
      sliderfailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isloadingSlider = false;
    notifyListeners();
    return apiResponse;
  }

  // Future<void> getSlider() async {
  //   isloadingSlider = true;
  //   notifyListeners();
  //   var data = await sliderRepo.getSlider();
  //   data.fold((failure) {
  //     sliderfailure = ServerFailure(failure.errMessage);
  //     isloadingSlider = false;
  //     isSliderFailure = true;
  //     notifyListeners();
  //   }, (slider) {
  //     sliderModelList.addAll(slider);
  //     isloadingSlider = false;
  //     notifyListeners();
  //   });
  // }

  // Future<void> getNotification() async {
  //   var data = await sliderRepo.getNotification();
  //   data.fold((failure) {}, (value) {
  //     notificationCount = value;
  //     notifyListeners();
  //   });
  // }
}
