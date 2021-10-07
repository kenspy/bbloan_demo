import 'package:bbloan/src/pages/rooms/controllers/room_controller.dart';
import 'package:bbloan/src/pages/rooms/widgets/forms.dart';
import 'package:bbloan/src/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRoomsUi extends StatelessWidget {
  final RoomController roomController = Get.put(RoomController());

  //
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: roomController.activeRoom.value.isEmpty
            ? roomSelect(context)
            : AuthFormUi(
                connectTitle: roomController.activeRoom.value,
              ),
      ),
    );
  }

  // Select between College & High School
  Widget roomSelect(context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: getIcons('college', Colors.grey.shade400, 60.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        "College",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          //
                          roomController.roomSelect('College');
                        },
                        child: Text(
                          "Connect".toUpperCase(),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade700,
                          elevation: 0.0,
                          fixedSize: Size(140.0, 40.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              padding: EdgeInsets.only(bottom: 30.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: getIcons('highschool', Colors.grey.shade400, 60.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        "High School",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          //
                          roomController.roomSelect('High School');
                        },
                        child: Text(
                          "Connect".toUpperCase(),
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0.0,
                          fixedSize: Size(140.0, 40.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
