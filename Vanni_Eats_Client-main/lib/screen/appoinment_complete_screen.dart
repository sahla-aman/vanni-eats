import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/screen/all_orders_show_screen.dart';
import 'package:servicehub_client/screen/main_screen.dart';
import 'package:servicehub_client/widget/rounded_border_button.dart';
import 'package:servicehub_client/widget/rounded_button.dart';

import '../widget/UpperSection.dart';

class AppoinmentCompleteScreen extends StatefulWidget {
  AppoinmentCompleteScreen({super.key});

  @override
  State<AppoinmentCompleteScreen> createState() =>
      _AppoinmentCompleteScreenState();
}

class _AppoinmentCompleteScreenState extends State<AppoinmentCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/fonts/bgimage.png"),
                fit: BoxFit.cover,
                colorFilter: null)),
        // margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 0,
          ),
          Column(
            children: [
              //  UpperSection(),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/check.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Order\nCompleted',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 30.0,
                  color: white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Your appointment has been\nprocessed with Vanni Eats',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 255, 233, 233),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedBorderButton(
                    buttonText: "View Appoinments",
                    buttonBackground: KOrange,
                    textColor: white,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllOrderFoodScreen(),
                          ));
                    }),
                const SizedBox(
                  height: 17,
                ),
                RoundedBorderButton(
                  buttonText: 'Home',
                  buttonBackground: white,
                  textColor: KOrange,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
