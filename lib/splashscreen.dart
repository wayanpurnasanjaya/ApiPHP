import 'package:flutter/material.dart';
import 'package:apiphp/main.dart';
import 'package:apiphp/session_manager.dart';
import 'package:apiphp/login_screen.dart';
import 'package:apiphp/news_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SessionManager sessionManager = SessionManager();
  Future cekSession() async{
    Future.delayed(const Duration(seconds: 3), () {
      sessionManager.getSession().then((value) {
        if (value != null) {
          Navigator.pushAndRemoveUntil(
              context,
             MaterialPageRoute(builder: (_) => const NewsPage()),
                   (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false);
        }
      });
    });
  }

  @override
  void initState(){
    super.initState();
    cekSession();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Welcome To My Portal")),
    );
  }
}
