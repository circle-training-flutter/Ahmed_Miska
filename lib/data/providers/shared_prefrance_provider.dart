import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/widgets/custom_snackbar.dart';
import '../models/response/product_model/product_datum.dart';

class SharedPref with ChangeNotifier {
  List<ProductModelItem> cartItems = [];

  double totalPrice() {
    double total = 0.0;
    for (var product in cartItems) {
      total += product.price! * product.weightUnit!;
    }
    return total;
  }

  double totalquantity() {
    double total = 0.0;
    for (var product in cartItems) {
      total += product.weightUnit!;
    }
    return total;
  }

  int productAmount(ProductModelItem product) {
    return product.weightUnit!;
  }

  dynamic totalProductPrice(ProductModelItem product) {
    return product.price! * product.weightUnit!;
  }

  void incrementQuantity(ProductModelItem product) {
    final index = cartItems.indexOf(product);
    if (index != -1) {
      cartItems[index].weightUnit = cartItems[index].weightUnit! + 1;
      notifyListeners();
      saveCartItems();
    }
  }

  void decrementQuantity(ProductModelItem product) {
    final index = cartItems.indexOf(product);
    if (index != -1 && cartItems[index].weightUnit! > 1) {
      cartItems[index].weightUnit = cartItems[index].weightUnit! - 1;
      saveCartItems();
      notifyListeners();
    }
  }

  Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = prefs.getString('cartItems') ?? '[]';
    List<dynamic> data = jsonDecode(jsonData);
    cartItems = data.map((e) => ProductModelItem.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = jsonEncode(cartItems.map((e) => e.toJson()).toList());
    await prefs.setString('cartItems', jsonData);
    notifyListeners();
  }

  void addToCart(ProductModelItem product, BuildContext context,
      {bool fromHome = false}) async {
    await loadCartItems();
    bool check = false;
    for (var item in cartItems) {
      if (item.id == product.id) {
        check = true;
        if (fromHome) {
          item.weightUnit = item.weightUnit! + 1;
        } else {
          item.weightUnit = product.weightUnit! + item.weightUnit!;
        }
        saveCartItems();
        notifyListeners();
        // ignore: use_build_context_synchronously
        customShowSnackBar(context, check);
        return;
      }
    }
    if (!check) {
      cartItems.add(product);
      saveCartItems();
      notifyListeners();
      // ignore: use_build_context_synchronously
      customShowSnackBar(context, check);
    }
  }

  void removeFromCart(ProductModelItem product) {
    cartItems.remove(product);
    saveCartItems();
  }
}
