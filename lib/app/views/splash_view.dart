import 'package:coodesh_challenge_f2/app/views/home/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomeView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
