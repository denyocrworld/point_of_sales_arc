import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/data/app_session.dart';
import 'package:flutter_hyper_ui/module/product_form/view/product_form_view.dart';
import 'package:flutter_hyper_ui/shared/widget/textfield/searchfield.dart';
import '../controller/product_controller.dart';

import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Product"),
            actions: [
              InkWell(
                onTap: () => Get.to(ProductFormView()),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ExSearchField(
                  id: "search",
                  label: "Search",
                  onSubmitted: (text) {
                    controller.filterProductName = text;
                    controller.update();
                  },
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: userCollection.collection("products").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return Text("Error");
                      if (!snapshot.hasData) return Text("No Data");
                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          var item = (data.docs[index].data() as Map);

                          if (controller.filterProductName.isNotEmpty) if (item[
                                  "product_name"]
                              .toString()
                              .contains(controller.filterProductName))
                            return Container();

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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
