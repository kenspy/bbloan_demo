import 'package:bbloan/src/pages/rooms/controllers/room_controller.dart';
import 'package:bbloan/src/pages/rooms/widgets/snackbars/snackbars.dart';
import 'package:bbloan/src/utils/icons.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AuthFormUi extends StatefulWidget {
  final String connectTitle;

  const AuthFormUi({Key? key, required this.connectTitle}) : super(key: key);

  @override
  _AuthFormUiState createState() => _AuthFormUiState();
}

class _AuthFormUiState extends State<AuthFormUi> {
  final RoomController roomController = Get.find();
  final _formKeys = [
    GlobalKey<FormState>(), // Basic
    GlobalKey<FormState>(), // Contact
    GlobalKey<FormState>(), // School
    GlobalKey<FormState>(), // Complete
  ];
  int _stepIndex = 0;
  StepperType stepType = StepperType.vertical;

  //
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _schoolNameController = TextEditingController();

  @override
  void initState() {
    _dobController.text = "";
    super.initState();
  }

  //
  isLast() {
    final lastStep = _stepIndex == 3;

    return lastStep;
  }

  //
  onTap(int step) {
    setState(() => _stepIndex = step);
  }

  onLast() {
    // Check for empty fields
    var fieldNotEmpty = _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _dobController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _schoolNameController.text.isNotEmpty &&
        roomController.country.value.isNotEmpty &&
        roomController.state.value.isNotEmpty &&
        roomController.city.value.isNotEmpty;

    if (!fieldNotEmpty) {
      showSnackbar(
        'Form is incomplete',
        'Empty field(s) detected',
        Icons.info,
      );
    } else if (isLast() &&
        this._formKeys.every((el) => el.currentState!.validate()) &&
        fieldNotEmpty) {
      var formValues = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'dob': _dobController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'schoolName': _schoolNameController.text,
        'country': roomController.country.value,
        'state': roomController.state.value,
        'city': roomController.city.value,
      };

      //
      roomController.getFormValues(formValues);
      Get.toNamed('/rooms/college/');
    }
  }

  //
  onContinue() {
    if (_formKeys[_stepIndex].currentState!.validate()) {
      _stepIndex < 3 ? setState(() => _stepIndex += 1) : null;
    }
  }

  //
  onCancel() {
    _stepIndex > 0 ? setState(() => _stepIndex -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //
          ListTile(
            leading: getIcons('widgets', Colors.blue.shade700, 30.0),
            title: Text(
              '${widget.connectTitle} Connect',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            trailing: TextButton(
              onPressed: () {
                //
                roomController.roomSelect('');
              },
              child: Text('Cancel'),
            ),
          ),

          //
          Expanded(
            child: Stepper(
              type: stepType,
              physics: ScrollPhysics(),
              currentStep: _stepIndex,
              steps: stepList(context),
              onStepTapped: (step) => onTap(step),
              onStepContinue: onContinue,
              onStepCancel: onCancel,
              controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                return Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 3.0, right: 3.0),
                          child: ElevatedButton(
                            onPressed: (!isLast()) ? onContinue : onLast,
                            child:
                                (isLast()) ? Text('Submit') : Text('Continue'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade300,
                              elevation: 0.0,
                              fixedSize: Size(75.0, 40),
                            ),
                          ),
                        ),
                      ),
                      if (_stepIndex > 0)
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 3.0, right: 3.0),
                            child: ElevatedButton(
                              onPressed: onCancel,
                              child: Text(
                                'Go back',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey.shade100,
                                elevation: 0.0,
                                fixedSize: Size(75.0, 40),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Steps List
  stepList(context) {
    return [
      // Basic
      Step(
        title: Text('Basic'),
        isActive: _stepIndex >= 0,
        state: _stepIndex >= 0 ? StepState.complete : StepState.disabled,
        content: Form(
          key: _formKeys[0],
          child: Column(
            children: [
              // First name
              Obx(
                () => TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: "First name",
                    focusColor: Colors.blue,
                    errorText: roomController.emptyTextError.value,
                  ),
                  validator: (value) {
                    roomController.validator(value);

                    return null;
                  },
                  onChanged: roomController.validator,
                ),
              ),

              // Last name
              Obx(
                () => TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: "Last name",
                    errorText: roomController.emptyTextError.value,
                  ),
                  validator: (value) {
                    roomController.validator(value);

                    return null;
                  },
                ),
              ),

              // Date of Birth
              Obx(
                () => TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    errorText: roomController.dobError.value,
                  ),
                  readOnly: true,
                  validator: (value) {
                    roomController.dobValidator(widget.connectTitle, value);

                    return null;
                  },
                  onChanged: (value) {
                    roomController.dobValidator(widget.connectTitle, value);
                  },
                  onTap: () async {
                    //
                    DateTime? showDob = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1940),
                      lastDate: DateTime.now(),
                    );

                    //
                    if (showDob != null) {
                      String formatDob =
                          DateFormat('MM/dd/yyyy').format(showDob);

                      setState(() {
                        _dobController.text = formatDob;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Contact Info
      Step(
        title: Text('Contact'),
        isActive: _stepIndex >= 1,
        state: _stepIndex >= 1 ? StepState.complete : StepState.disabled,
        content: Form(
          key: _formKeys[1],
          child: Column(
            children: [
              // Email
              Obx(
                () => TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Email",
                    errorText: roomController.emailError.value,
                  ),
                  validator: (value) {
                    roomController.emailValidator(value);

                    return null;
                  },
                  onChanged: roomController.emailValidator,
                ),
              ),

              // Phone
              Obx(
                () => TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    errorText: roomController.phoneError.value,
                  ),
                  validator: (value) {
                    roomController.phoneValidator(value!);

                    return null;
                  },
                  onChanged: roomController.phoneValidator,
                ),
              ),
            ],
          ),
        ),
      ),

      // School Info
      Step(
        title: Text('School'),
        isActive: _stepIndex >= 2,
        state: _stepIndex >= 2 ? StepState.complete : StepState.disabled,
        content: Form(
          key: _formKeys[2],
          child: Column(
            children: [
              //
              Obx(
                () => TextFormField(
                  controller: _schoolNameController,
                  decoration: InputDecoration(
                    labelText: "School name",
                    errorText: roomController.emptyTextError.value,
                  ),
                  validator: (value) {
                    roomController.validator(value);

                    return null;
                  },
                ),
              ),

              //
              Column(
                children: [
                  SelectState(
                    onCountryChanged: (value) {
                      roomController.getCountry(value);
                    },
                    onStateChanged: (value) {
                      roomController.getState(value);
                    },
                    onCityChanged: (value) {
                      roomController.getCity(value);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Complete
      Step(
        title: Text('Complete'),
        isActive: _stepIndex >= 3,
        state: _stepIndex >= 3 ? StepState.complete : StepState.disabled,
        content: Form(
          key: _formKeys[3],
          child: Column(
            children: [
              //

              //
              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
                child: Center(
                  child: Text(
                    'Click the submit button to connect.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
