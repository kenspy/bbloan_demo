import 'package:bbloan/src/pages/home/controllers/home_controller.dart';
import 'package:bbloan/src/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    //
    var _appList = _homeController.appList;

    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 968.0),
          child: Obx(
            () {
              if (_homeController.isLoading.value) {
                return Container(
                  height: 300.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30.0, bottom: 50.0),
                      child: Text(
                        "BBLoan Applications".toUpperCase(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),

                    //
                    Container(
                      height: 180.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _appList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: screenSize.width > 768.0 ? 300.0 : 200.0,
                            height: 180.0,
                            padding: EdgeInsets.only(
                              left: screenSize.width > 768.0 ? 20.0 : 5.0,
                              right: screenSize.width > 768.0 ? 20.0 : 5.0,
                            ),
                            child: Card(
                              child: InkWell(
                                onTap: () {
                                  //
                                  Get.toNamed(
                                    '/${_appList[index].path}/',
                                    arguments: _appList[index].title,
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.0),
                                      child: CircleAvatar(
                                        radius: 40.0,
                                        child: getIcons(_appList[index].title,
                                            Colors.white, 43.0),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        _appList[index].title.toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
