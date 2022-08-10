import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/module/pos/controller/pos_controller.dart';
import '../controller/pos_checkout_controller.dart';

import 'package:get/get.dart';

class PosCheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PosCheckoutController>(
      init: PosCheckoutController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Checkout"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        var item = controller.products[index];

                        var total = double.parse(item["qty"].toString()) *
                            double.parse(item["price"]);

                        return Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.grey[400]!.withOpacity(0.4),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("${item["product_name"]}"),
                              ),
                              Text("${item["qty"]} x \$${item["price"]}"),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                width: 60.0,
                                child: Text(
                                  "\$${total}",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "\$${controller.orderTotal}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ExRadio(
                  id: "payment_method",
                  label: "Payment Method",
                  items: [
                    {
                      "label": "Cash",
                      "value": "Cash",
                    },
                    {
                      "label": "Gopay",
                      "value": "Gopay",
                    },
                    {
                      "label": "Ovo",
                      "value": "Ovo",
                    },
                    {
                      "label": "Credit Card",
                      "value": "Credit Card",
                    },
                    {
                      "label": "Bank Transfer",
                      "value": "Bank Transfer",
                    },
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ExButton(
                  label: "Checkout",
                  onPressed: () => controller.doCheckout(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
