import 'package:bbloan/src/pages/rooms/controllers/room_controller.dart';
import 'package:bbloan/src/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectUi extends StatefulWidget {
  @override
  _ConnectUiState createState() => _ConnectUiState();
}

class _ConnectUiState extends State<ConnectUi> {
  final RoomController roomController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final is768 = screenSize.width > 768;

    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: is768 ? 70.0 : 0.0),
                      constraints: BoxConstraints(
                          maxWidth: is768 ? 568.0 : screenSize.width),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          //
                          Card(
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 200.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/user_cover.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          //
                          !is768
                              ? Positioned(
                                  left: 10.0,
                                  top: 10.0,
                                  child: Container(
                                    child: IconButton(
                                      onPressed: () {
                                        Get.toNamed('/home/');
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),

                          //
                          Positioned(
                            left: 20.0,
                            top: 70.0,
                            child: Container(
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.white,
                                child: Text(
                                  'J',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //
                    Container(
                      padding: EdgeInsets.only(top: is768 ? 20.0 : 0.0),
                      constraints: BoxConstraints(
                          maxWidth: is768 ? 568.0 : screenSize.width),
                      child: Column(
                        children: [
                          // basic
                          Card(
                            child: Column(
                              children: [
                                Container(
                                  child: ListTile(
                                    title: Text(
                                      'Basic',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                //
                                ListTile(
                                  title: Text('First name'),
                                  subtitle: Text(
                                      roomController.formData['firstName']),
                                ),

                                //
                                ListTile(
                                  title: Text('Last name'),
                                  subtitle:
                                      Text(roomController.formData['lastName']),
                                ),

                                //
                                ListTile(
                                  title: Text('Date of Birth'),
                                  subtitle:
                                      Text(roomController.formData['dob']),
                                ),
                              ],
                            ),
                          ),

                          // Contact
                          Card(
                            child: Column(
                              children: [
                                Container(
                                  child: ListTile(
                                    title: Text(
                                      'Contact',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                //
                                ListTile(
                                  title: Text('Phone number'),
                                  subtitle:
                                      Text(roomController.formData['phone']),
                                ),

                                //
                                ListTile(
                                  title: Text('Email address'),
                                  subtitle:
                                      Text(roomController.formData['email']),
                                ),
                              ],
                            ),
                          ),

                          // School
                          Container(
                            margin: EdgeInsets.only(bottom: 70.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Container(
                                    child: ListTile(
                                      title: Text(
                                        'School',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //
                                  ListTile(
                                    title: Text('School name'),
                                    subtitle: Text(
                                        roomController.formData['schoolName']),
                                  ),

                                  //
                                  ListTile(
                                    title: Text('Country'),
                                    subtitle: Text(
                                        roomController.formData['country']),
                                  ),

                                  //
                                  ListTile(
                                    title: Text('State'),
                                    subtitle:
                                        Text(roomController.formData['state']),
                                  ),

                                  //
                                  ListTile(
                                    title: Text('City'),
                                    subtitle:
                                        Text(roomController.formData['city']),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          is768
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: ListTile(
                      leading: getIcons('widgets', Colors.blue.shade700, 40.0),
                      title: Text(
                        "BBLoan",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
