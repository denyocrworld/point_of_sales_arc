import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/module/order/view/order_view.dart';
import 'package:flutter_hyper_ui/module/pos/view/pos_view.dart';
import 'package:flutter_hyper_ui/module/product/view/product_view.dart';
import '../controller/dashboard_controller.dart';

import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Dashboard"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 140.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://i.ibb.co/3pPYd14/freeban.jpg",
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Wrap(
                  children: [
                    InkWell(
                      onTap: () => Get.to(ProductView()),
                      child: Container(
                        width: (Get.width - 40) / 4,
                        child: Column(
                          children: [
                            Icon(
                              Icons.food_bank,
                              color: Colors.red[400],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Product",
                              style: TextStyle(
                                color: Colors.red[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(OrderView()),
                      child: Container(
                        width: (Get.width - 40) / 4,
                        child: Column(
                          children: [
                            Icon(
                              Icons.list,
                              color: Colors.purple[400],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Order",
                              style: TextStyle(
                                color: Colors.purple[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(PosView()),
                      child: Container(
                        width: (Get.width - 40) / 4,
                        child: Column(
                          children: [
                            Icon(
                              Icons.point_of_sale,
                              color: Colors.green[400],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "POS",
                              style: TextStyle(
                                color: Colors.green[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
