import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hyper_ui/module/login/view/login_view.dart';
import 'package:get/get.dart';
import '../view/profile_view.dart';

class ProfileController extends GetxController {
  ProfileView? view;

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

  doLogout() async {
    await FirebaseAuth.instance.signOut();
    await Get.deleteAll();
    Get.offAll(LoginView());
  }
}
