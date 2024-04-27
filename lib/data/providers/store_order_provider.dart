import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/data/models/body/store_order_request_model.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/store_order_model/store_order_model.dart';
import 'package:circletraning/data/providers/shared_prefrance_provider.dart';
import 'package:circletraning/data/repository/store_order_repo.dart';
import 'package:circletraning/features/orders/ui/my_orders_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StoreOrderProvider with ChangeNotifier {
  final StoreOrderRepo storeOrderRepo;
  SharedPref sharedPref = getIt();

  StoreOrderProvider({required this.storeOrderRepo});

  bool isLoading = false;
  StoreOrderModel? orderCostModel;
  StoreOrderModel? get orderModel => orderCostModel;

  Future<ApiResponse> storeOrder(StoreOrderRequestModel requestBody) async {
    isLoading = true;
    notifyListeners();
    var responseModel = await storeOrderRepo.storeOrder(requestBody);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      isLoading = false;
      orderCostModel = StoreOrderModel.fromJson(responseModel.response?.data);
      if (orderCostModel != null && orderCostModel?.code == 200) {
        sharedPref.clearCart();
        notifyListeners();
        pushReplacement(const MyOrdersScreen(
          check: true,
        ));
      }
    } else {
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: responseModel.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
