import 'package:flutter_hyper_ui/data/app_session.dart';
import 'package:get/get.dart';
import '../view/pos_view.dart';

class PosController extends GetxController {
  PosView? view;
  List products = [];

  @override
  void onInit() async {
    super.onInit();
    await loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadData() async {
    var snapshot = await userCollection.collection("products").get();

    snapshot.docs.forEach((doc) {
      var d = doc.data();
      products.add({
        "id": doc.id,
        "photo": d["photo"],
        "product_name": d["product_name"],
        "price": d["price"],
        "description": d["description"],
      });
    });

    update();
  }
}
