import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/screen/main_screen.dart';
import 'package:servicehub_client/widget/rounded_border_button.dart';
import 'package:servicehub_client/widget/rounded_button.dart';

class TaskCompleteScreen extends StatelessWidget {
  const TaskCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              color: white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/check.png',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Payment\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 30.0,
                            color: darkText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Your appointment has been\nprocessed with servcehub',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 12.0,
                            color: lightGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RoundedButton(
                          bgcolor: white,
                          buttonText: 'View Appoinmnets',
                          onPress: () {},
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        RoundedBorderButton(
                          buttonText: 'Home',
                          buttonBackground: white,
                          textColor: kPrimary,
                          onPress: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const MainScreen()));
                          },
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
