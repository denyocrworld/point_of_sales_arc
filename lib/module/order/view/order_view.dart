import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/data/app_session.dart';
import '../controller/order_controller.dart';

import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Order"),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: userCollection.collection("orders").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error");
              if (!snapshot.hasData) return Text("No Data");
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.docs.length,
                itemBuilder: (context, index) {
                  var item = (data.docs[index].data() as Map);
                  item["id"] = data.docs[index].id;

                  return Card(
                    child: ListTile(
                      title: Text("${item["id"]}"),
                      subtitle: Text("${item["payment_method"]}"),
                      trailing: Text("\$${item["total"] ?? "0"}"),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
