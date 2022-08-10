import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/module/dashboard/view/dashboard_view.dart';
import 'package:flutter_hyper_ui/module/favorite/view/favorite_view.dart';
import 'package:flutter_hyper_ui/module/profile/view/profile_view.dart';
import '../controller/main_navigation_controller.dart';

import 'package:get/get.dart';

class MainNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(
      init: MainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return ExNavigation(
          children: [
            DashboardView(),
            FavoriteView(),
            ProfileView(),
          ],
          menus: [
            NavigationItem(
              icon: Icons.dashboard,
              label: "Dashboard",
            ),
            NavigationItem(
              icon: Icons.favorite,
              label: "Favorite",
            ),
            NavigationItem(
              icon: Icons.person,
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}
