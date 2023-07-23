import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/controller/apicontroller.dart';
import 'package:servicehub_client/screen/register_screen.dart';
import 'package:servicehub_client/widget/UpperSection.dart';
import 'package:servicehub_client/widget/app_name_widget.dart';
import 'package:servicehub_client/widget/rounded_border_button.dart';
import 'package:servicehub_client/widget/rounded_button.dart';

import '../widget/CircleLogo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Apicontroller apicontroller = Apicontroller();
  final UsernameControlleer = TextEditingController();
  final PasswordControlleer = TextEditingController();

  final UserNameFocusNode = FocusNode();
  final PasswordFocusNode = FocusNode();
  AutovalidateMode switched = AutovalidateMode.disabled;
  final _usernameformKey = GlobalKey<FormState>();
  final _passwordformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/fonts/bgimage.png"),
                fit: BoxFit.cover,
                colorFilter: null),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                const Positioned(
                  top: 135,
                  left: 10,
                  child: CircleLogo(),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const UpperSection(),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            const Center(
                              child: Text('Welcome',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 40.0,
                                    color: KOrange,
                                    fontWeight: FontWeight.w900,
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Form(
                              key: _usernameformKey,
                              autovalidateMode: switched,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Name is required';
                                  }
                                  if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'Name can only contain letters and spaces';
                                  }
                                  return null;
                                },
                                controller: UsernameControlleer,
                                focusNode: UserNameFocusNode,
                                style: const TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: lightText,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText:
                                      '                           User name',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 15,
                                    color: Colors.grey,
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                  ),
                                  fillColor: inputFieldBackgroundColor,
                                  contentPadding: const EdgeInsets.all(4.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Form(
                              key: _passwordformKey,
                              autovalidateMode: switched,
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                                controller: PasswordControlleer,
                                focusNode: PasswordFocusNode,
                                style: const TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: lightText,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText:
                                      '                            Password',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 15,
                                    color: Colors.grey,
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                  ),
                                  fillColor: inputFieldBackgroundColor,
                                  contentPadding: const EdgeInsets.all(4.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            RoundedButton(
                              bgcolor: KGreen,
                              buttonText: 'Sign in',
                              onPress: () {
                                if (_usernameformKey.currentState!.validate() &&
                                    _passwordformKey.currentState!.validate()) {
                                  CircularProgressIndicator();
                                  apicontroller.login(UsernameControlleer.text,
                                      PasswordControlleer.text, context);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            RoundedButton(
                              bgcolor: KPink,
                              buttonText: 'Sign up',
                              onPress: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const RegisterScreen()));
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 242,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Text('Fogot Password ?',
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 14.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ],
                            )
                          ],
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
    );
  }
}
