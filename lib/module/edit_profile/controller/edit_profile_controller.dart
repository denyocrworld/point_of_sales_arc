import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/data/app_session.dart';
import 'package:get/get.dart';
import '../view/edit_profile_view.dart';

class EditProfileController extends GetxController {
  EditProfileView? view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  doEdit() async {
    var photo = Input.get("photo");
    var name = Input.get("name");

    await userCollection.update({
      "name": name,
      "photo": photo,
    });

    Get.back();
  }
}
