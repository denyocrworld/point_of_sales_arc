import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/module/order/view/order_view.dart';
import 'package:flutter_hyper_ui/module/pos/view/pos_view.dart';
import 'package:flutter_hyper_ui/module/product/view/product_view.dart';
import 'package:flutter_hyper_ui/shared/widget/slider/slider.dart';
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
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome bro!",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "Let's relax and watch movie",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1614901859929-0ba2cd665950?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ExSlider(
                    items: [
                      {
                        "id": 1,
                        "photo":
                            "https://thumbor.prod.vidiocdn.com/OLVC3ZXqqBFciq_LXuoYrLIQO5Y=/223x332/filters:quality(75)/vidio-web-prod-film/uploads/film/image_portrait/1756/serigala-terakhir-ec6e22.jpg",
                        "onTap": (item) {
                          print("Test");
                        },
                      },
                      {
                        "id": 2,
                        "photo":
                            "https://thumbor.prod.vidiocdn.com/OLVC3ZXqqBFciq_LXuoYrLIQO5Y=/223x332/filters:quality(75)/vidio-web-prod-film/uploads/film/image_portrait/1756/serigala-terakhir-ec6e22.jpg",
                        "onTap": (item) {
                          print("Test");
                        },
                      }
                    ],
                  ),
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
                  ExSearchField(
                    id: "search",
                    label: "Search",
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Container(
                          height: 160.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://i.ibb.co/Ksk6d1K/movie.webp",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 160.0,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Pertaruhan",
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                ExRating(
                                  id: "rating",
                                  value: 4,
                                  itemSize: 18.0,
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  "1h 30min",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              color: Colors.orange,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  "Book",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
          ),
        );
      },
    );
  }
}
