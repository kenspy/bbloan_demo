import 'dart:convert';

import 'package:bbloan/api/apps.dart';
import 'package:bbloan/src/pages/home/models/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var appList = <HomeModel>[].obs;

  @override
  void onInit() {
    //
    getApps();
    super.onInit();
  }

  // Get apps information from JSON
  Future getApps() async {
    var apiJson = await apiApps();

    try {
      //
      isLoading(true);

      //
      List resp = json.decode(apiJson);
      var apps = resp.map((app) => HomeModel.fromJson(app)).toList();

      //
      appList.value = apps;
    } finally {
      isLoading(false);
    }
  }
}
