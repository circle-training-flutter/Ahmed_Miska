import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/data/models/body/calculate_order_cost_request_model.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/calculate_order_cost_model.dart/calculate_order_cost_model.dart';
import 'package:circletraning/data/providers/shared_prefrance_provider.dart';
import 'package:circletraning/data/repository/calculate_order_cost_repo.dart';
import 'package:circletraning/features/bill/ui/bill_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalculateOrderCostProvider with ChangeNotifier {
  final CalculateOrderCostRepo calculateOrderCostRepo;
  List<Detail> details = [];
  SharedPref sharedPref = getIt();
  TextEditingController noteController = TextEditingController();
  String payType = 'cash';

  CalculateOrderCostProvider({required this.calculateOrderCostRepo});
  bool isLoading = false;
  OrderCostModel? orderCostModel;
  OrderCostModel? get orderCost => orderCostModel;

  Future<ApiResponse> calculateOrderCost(OrderCostRequestModel requestBody) async {
    for (int i = 0; i < sharedPref.cartItems.length; i++) {
      int id = sharedPref.cartItems[i].id!;
      int quantity = sharedPref.cartItems[i].weightUnit!;
      details.add(Detail(productId: id, qty: quantity, netCost: 0));
    }
    isLoading = true;
    notifyListeners();
    var responseModel = await calculateOrderCostRepo.calculateOrderCost(requestBody);

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      isLoading = false;
      orderCostModel = OrderCostModel.fromJson(responseModel.response?.data);
      if (orderCostModel != null && orderCostModel?.code == 200) {
        push(const BillScreen());
      } else if (responseModel.response?.statusCode == 422) {
        Fluttertoast.showToast(msg: responseModel.response?.data['message']);
      }
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
