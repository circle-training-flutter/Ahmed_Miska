import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/response/base/api_response.dart';
import '../models/response/city_model/city_model.dart';
import '../repository/city_repo.dart';

class CityProvider with ChangeNotifier {
  final List<CityModel> cityList = [];
  final CityRepo cityRepo;

  GetCityModel? _getCityModel;
  CityModel? _cityModel;

  GetCityModel? get getCityModel => _getCityModel;
  CityModel? get cityModel => _cityModel;

  bool isFailure = false;
  bool isLoading = false;
  CityProvider(this.cityRepo);

  Future<ApiResponse> getCity() async {
    cityList.clear();
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await cityRepo.getCity();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _getCityModel = GetCityModel.fromJson(apiResponse.response!.data);
      if (_getCityModel!.code == 200) {
        cityList.addAll(_getCityModel!.data!);
      } else {
        Fluttertoast.showToast(msg: _getCityModel!.message!);
      }
    } else {
      isFailure = true;
      Fluttertoast.showToast(msg: apiResponse.error);
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
