import 'package:bbloan/src/pages/home/home.dart';
import 'package:bbloan/src/pages/loans/loans.dart';
import 'package:bbloan/src/pages/rooms/rooms.dart';
import 'package:bbloan/src/pages/rooms/widgets/connect.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> bbloanPages() {
  return [
    GetPage(
      name: '/rooms/',
      title: 'User Rooms - Kenson.app',
      page: () => RoomUi(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/rooms/college/',
      title: 'College Room - Kenson.app',
      page: () => ConnectUi(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/loans/',
      title: 'Loans - Kenson.app',
      page: () => LoanUi(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/home/',
      title: 'BBLoan - Kenson.app',
      page: () => HomeUi(),
      transition: Transition.fadeIn,
    ),
  ];
}
