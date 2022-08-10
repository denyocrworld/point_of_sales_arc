import 'package:flutter/material.dart';
import '../controller/favorite_controller.dart';

import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Favorite"),
          ),
        );
      },
    );
  }
}