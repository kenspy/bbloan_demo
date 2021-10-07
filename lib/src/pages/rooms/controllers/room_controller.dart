import 'package:bbloan/src/pages/rooms/widgets/snackbars/snackbars.dart';
import 'package:bbloan/src/utils/dates.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomController extends GetxController {
  var emptyTextError = ''.obs;
  var dobError = ''.obs;
  var emailError = ''.obs;
  var phoneError = ''.obs;
  var activeRoom = ''.obs;
  var country = ''.obs;
  var state = ''.obs;
  var city = ''.obs;
  var formData = {}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Default field validator
  validator(String? value) async {
    if (value == null || value.isEmpty) {
      emptyTextError.value = 'Field is empty';
    } else {
      emptyTextError.value = '';
    }

    return null;
  }

  // Date of Birth validator
  dobValidator(String? form, String? value) {
    if (value == null || value.isEmpty) {
      dobError.value = 'Date of Birth is empty';
    } else {
      dobError.value = '';
    }

    if (value!.isNotEmpty) {
      if (form == 'College' && getAge(value) < 17) {
        dobError.value = 'You\'re too young for college.';

        return showSnackbar("Date of Birth", dobError.value, Icons.info);
      } else if (form == 'High School' && getAge(value) < 14) {
        dobError.value = 'You\'re too young for High School.';

        return showSnackbar("Date of Birth", dobError.value, Icons.info);
      } else if (form == 'High School' && getAge(value) > 21) {
        dobError.value = 'You\'re too old for High School.';

        return showSnackbar("Date of Birth", dobError.value, Icons.info);
      } else {
        dobError.value = '';
      }
    }

    return null;
  }

  // Email validator
  emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      emailError.value = 'Email is empty';
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = 'Email is invalid';
    } else {
      emailError.value = '';
    }

    return null;
  }

  // Phone
  phoneValidator(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      phoneError.value = 'Only numbers allowed';
    } else {
      phoneError.value = '';
    }

    if (value.length < 9) {
      phoneError.value = 'Phone number is too short';
    } else {
      phoneError.value = '';
    }

    return null;
  }

  //
  getCountry(String value) {
    country.value = value;
  }

  //
  getState(String value) {
    state.value = value;
  }

  //
  getCity(String value) {
    city.value = value;
  }

  //
  getFormValues(Map value) {
    formData.value = value;
  }

  // Room selector
  void roomSelect(String value) async {
    activeRoom.value = value;

    update();
  }
}
