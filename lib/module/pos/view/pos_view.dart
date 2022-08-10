import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/module/pos_checkout/view/pos_checkout_view.dart';
import '../controller/pos_controller.dart';

import 'package:get/get.dart';

class PosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PosController>(
      init: PosController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Pos"),
          ),
          bottomNavigationBar: Container(
            height: 110.0,
            padding: const EdgeInsets.all(20.0),
            child: ExButton(
              label: "Checkout",
              onPressed: () => Get.to(PosCheckoutView()),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                var item = controller.products[index];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(
                        item["photo"] ??
                            "https://i.ibb.co/S32HNjD/no-image.jpg",
                      ),
                    ),
                    title: Text("${item["product_name"]}"),
                    subtitle: Text("\$${item["price"]}"),
                    trailing: Container(
                      width: 120.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              item["qty"] = item["qty"] ?? 0;
                              if (item["qty"] == 0) return;

                              item["qty"]--;
                              controller.update();
                            },
                            child: Card(
                              color: Colors.grey[800],
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${item["qty"] ?? 0}",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              item["qty"] = item["qty"] ?? 0;
                              item["qty"]++;
                              controller.update();
                            },
                            child: Card(
                              color: Colors.grey[800],
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
