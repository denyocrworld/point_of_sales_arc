import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import '../controller/product_form_controller.dart';

import 'package:get/get.dart';

class ProductFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductFormController>(
      init: ProductFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Product Form"),
            actions: [
              ExButton(
                label: "Save",
                color: Colors.orange[900],
                onPressed: () => controller.doSave(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ExImagePicker(
                    id: "photo",
                    label: "Photo",
                  ),
                  ExTextField(
                    id: "product_name",
                    label: "Product Name",
                  ),
                  ExTextField(
                    id: "price",
                    label: "Price",
                    keyboardType: TextInputType.number,
                    value: "0",
                  ),
                  ExTextArea(
                    id: "description",
                    label: "Description",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
