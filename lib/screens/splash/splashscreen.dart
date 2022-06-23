import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(seconds: 2),
    //     () => Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => const DonationScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Grow Pet",
          style: TextStyle(color: const Color(0xffC262FD), fontSize: 42.sp),
        ),
      ),
    );
  }
}
