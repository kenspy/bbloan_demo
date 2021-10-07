import 'package:bbloan/src/pages/home/home.dart';
import 'package:bbloan/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(  
    MainApp()
  );
}

class MainApp extends StatefulWidget {
  @override 
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BBLoan',
      home: HomeUi(),
      locale: Get.deviceLocale,
      getPages: bbloanPages(),
      initialRoute: "/",
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.grey.shade100,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
    );
  }

}
