import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingSplashScreen extends StatefulWidget {
  const OnBoardingSplashScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingSplashScreen> createState() => _OnBoardingSplashScreenState();
}

class _OnBoardingSplashScreenState extends State<OnBoardingSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(seconds: 2),
    //     () => Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Grow Pet OnBoarding",
          style: TextStyle(color: const Color(0xffC262FD), fontSize: 42.sp),
        ),
      ),
    );
  }
}
