import 'package:bbloan/src/pages/rooms/widgets/auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bbloan/src/utils/icons.dart';
import 'package:flutter/material.dart';

class RoomUi extends StatefulWidget {
  final path;

  const RoomUi({Key? key, this.path}) : super(key: key);

  @override
  _RoomUiState createState() => _RoomUiState();
}

class _RoomUiState extends State<RoomUi> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final is768 = screenSize.width > 768;

    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            children: [
              //
              is768
                  ? Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/auth_form_background.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text(
                                    'Sign up to connect with your ',
                                    style: TextStyle(fontSize: 40.0),
                                  ),
                                  DefaultTextStyle(
                                    style: const TextStyle(
                                      fontSize: 40.0,
                                    ),
                                    child: AnimatedTextKit(
                                      isRepeatingAnimation: true,
                                      repeatForever: true,
                                      animatedTexts: [
                                        TypewriterAnimatedText('classmate'),
                                        TypewriterAnimatedText('teacher'),
                                        TypewriterAnimatedText('club'),
                                        TypewriterAnimatedText('school'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: ListTile(
                                leading: getIcons(
                                    'widgets', Colors.blue.shade700, 40.0),
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
                          ),
                        ],
                      ),
                    )
                  : Container(),

              //
              Container(
                width: is768 ? 400.0 : screenSize.width,
                height: screenSize.height,
                child: Card(
                  elevation: is768 ? 8.0 : 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  margin: EdgeInsets.all(0.0),
                  child: AuthRoomsUi(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
