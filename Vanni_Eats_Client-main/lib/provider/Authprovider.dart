import 'package:flutter/material.dart';
import 'package:servicehub_client/screen/login_screen.dart';
import 'package:servicehub_client/screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Future<void> initializeUser(BuildContext context) async {
    final details = await SharedPreferences.getInstance();
    if (details.getBool("islog") == true) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }
}
