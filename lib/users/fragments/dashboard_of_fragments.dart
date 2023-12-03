import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saclothesapp/users/userPreferences/current_user.dart';

class DashboardOfFragments extends StatelessWidget {
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (state) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold();
      },
    );
  }
}
