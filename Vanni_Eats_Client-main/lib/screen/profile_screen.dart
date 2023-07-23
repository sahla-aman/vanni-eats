import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/controller/apicontroller.dart';
import 'package:servicehub_client/screen/add_new_address_screen.dart';
import 'package:servicehub_client/widget/CircleLogo.dart';
import 'package:servicehub_client/widget/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/UpperSection.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Apicontroller apicontroller = Apicontroller();
  bool _isButtonOn = true;
  bool _readonly = true;
  final _fullnameformKey = GlobalKey<FormState>();
  final _emailformKey = GlobalKey<FormState>();
  final _phnnumberformkey = GlobalKey<FormState>();
  void _toggleButton() {
    setState(() {
      _isButtonOn = !_isButtonOn;
    });
  }

  void readonly() {
    setState(() {
      _readonly = !_readonly;
    });
  }

  String userid = '';

  getuserdata() async {
    final details = await SharedPreferences.getInstance();
    setState(() {
      userid = details.getString('userId').toString();
    });
    print("my user id is : " + userid.toString());
    apicontroller.getuserdetailss(userid.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();

    getcustomerdata();
  }

  getcustomerdata() async {
    final details = await SharedPreferences.getInstance();
    setState(() {
      fullNameControlleer.text = details.getString('username').toString();
      phoneNumberControlleer.text =
          details.getString('phone_number').toString();
      emailControlleer.text = details.getString('pw').toString();
    });
  }

  final fullNameControlleer = TextEditingController();
  final phoneNumberControlleer = TextEditingController();
  final emailControlleer = TextEditingController();
  final addressControlleer = TextEditingController();

  final fullNameFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final addressFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    fullNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    emailFocusNode.dispose();
    fullNameControlleer.dispose();
    phoneNumberControlleer.dispose();
    emailControlleer.dispose();
    addressControlleer.dispose();
    addressFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        //   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Center(
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fonts/bgimage.png"),
                    fit: BoxFit.cover,
                    colorFilter: null)),
            child: Stack(
              children: [
                Positioned(
                  top: 135,
                  left: 21,
                  child: CircleLogo(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UpperSection(),
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'My Profile',
                            style: screenTitle,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            'Full Name',
                            style: labelText,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Form(
                            key: _fullnameformKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              readOnly: _readonly,
                              controller: fullNameControlleer,
                              keyboardType: TextInputType.text,
                              focusNode: fullNameFocusNode,
                              style: const TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                              ),
                              decoration: formInputStyle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Full name is required';
                                }
                                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                  return 'Full name can only contain letters and spaces';
                                }
                                return null;
                              },
                            ),
                          ),
                          Text(
                            'Phone Number',
                            style: labelText,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Form(
                            key: _phnnumberformkey,
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              readOnly: _readonly,
                              controller: phoneNumberControlleer,
                              keyboardType: TextInputType.phone,
                              focusNode: phoneNumberFocusNode,
                              style: const TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                              ),
                              decoration: formInputStyle,
                              validator: (value) {
                                if (phoneNumberControlleer.text ==
                                    "phone number") {
                                  return null;
                                } else {
                                  if (value == null || value.isEmpty) {
                                    return 'Phone number is required';
                                  }
                                  if (value.length != 10) {
                                    return 'Phone number must have 10 digits';
                                  }
                                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                    return 'Invalid phone number';
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                          Text(
                            'Password',
                            style: labelText,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Form(
                            key: _emailformKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              readOnly: _readonly,
                              controller: emailControlleer,
                              keyboardType: TextInputType.phone,
                              focusNode: emailFocusNode,
                              style: const TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                              ),
                              decoration: formInputStyle,
                              validator: (value) {
                                if (emailControlleer.text ==
                                    "password is required") {
                                  return null;
                                } else {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _isButtonOn
                              ? RoundedButton(
                                  buttonText: "Edit",
                                  onPress: () {
                                    readonly();
                                    _toggleButton();
                                  },
                                  bgcolor: KOrange)
                              : RoundedButton(
                                  buttonText: "Save",
                                  onPress: () {
                                    if (_phnnumberformkey.currentState!
                                            .validate() &&
                                        _fullnameformKey.currentState!
                                            .validate() &&
                                        _emailformKey.currentState!
                                            .validate()) {
                                      apicontroller.updateprofile(
                                          userid.toString(),
                                          fullNameControlleer.text,
                                          phoneNumberControlleer.text,
                                          emailControlleer.text,
                                          context);

                                      apicontroller
                                          .getuserdetailss(userid.toString());
                                      readonly();
                                      _toggleButton();
                                    }
                                  },
                                  bgcolor: KOrange)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField(String labelName, TextEditingController controller,
      TextInputType inputType, FocusNode focusNode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: labelText,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
            controller: controller,
            keyboardType: inputType,
            focusNode: focusNode,
            style: const TextStyle(
                fontFamily: 'Segoe UI', fontSize: 20, color: lightText),
            decoration: formInputStyle),
      ],
    );
  }
}
