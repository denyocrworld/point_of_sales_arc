import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/data/app_session.dart';
import 'package:flutter_hyper_ui/module/dashboard/view/dashboard_view.dart';
import 'package:flutter_hyper_ui/module/main_navigation/view/main_navigation_view.dart';
import 'package:flutter_hyper_ui/module/pos/controller/pos_controller.dart';
import 'package:get/get.dart';
import '../view/pos_checkout_view.dart';

class PosCheckoutController extends GetxController {
  PosCheckoutView? view;
  List products = [];

  @override
  void onInit() {
    super.onInit();
    PosController posController = Get.find();
    products = posController.products
        .where((i) => i["qty"] != null && i["qty"] > 0)
        .toList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  double get orderTotal {
    var _orderTotal = 0.0;
    for (var product in products) {
      _orderTotal += product["qty"] * double.parse(product["price"]);
    }
    return _orderTotal;
  }

  doCheckout() async {
    var paymentMethod = Input.get("payment_method");
    await userCollection.collection("orders").add({
      "created_at": Timestamp.now(),
      "payment_method": paymentMethod,
      "items": products,
      "total": orderTotal,
    });

    Get.offAll(MainNavigationView());
  }
}
