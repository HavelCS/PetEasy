// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutable, avoid_unnecessary_containers, avoid_print, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:grow_pet/screens/login/signin.dart';
import 'package:grow_pet/screens/onboarding/onboardingcontent.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: EdgeInsets.only(top: 61.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 61.0),
                            child: Container(
                              width: 476.h,
                              height: 317.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/onboarding.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 71.h,
                              left: 56.w,
                              right: 57.w,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 39.h),
                                  child: Text(
                                    "GrowPet",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: pinkShade,
                                        fontSize: 42.sp,
                                        fontFamily: 'HelveticaBold'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 18.h),
                                  child: Text(
                                    contents[i].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontFamily: 'ArialBold'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 50.h),
                                  child: Text(
                                    contents[i].subtitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff909090),
                                        fontSize: 14.sp,
                                        fontFamily: 'HelveticaRegular'),
                                  ),
                                ),
                                Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    contents.length,
                                    (index) => buildDot(index, context),
                                  ),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 26.w, vertical: 38.h),
                  child: InkWell(
                    onTap: () async {
                      print(currentIndex);
                      if (currentIndex == contents.length - 1) {
                        // await _storeOnboardInfo();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      }

                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 346.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                          color: pinkShade,
                          borderRadius: BorderRadius.circular(7)),
                      child: Text(
                        currentIndex == contents.length - 1
                            ? "Let’s Spread Love"
                            : "Next",
                        style: TextStyle(
                            letterSpacing: 0.005,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontFamily: 'ArialBold'), // this is a comment
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6.h,
      width: currentIndex == index ? 6.w : 6.w,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: currentIndex == index ? Color(0xffC262FD) : Color(0xffE0E0E0)),
    );
  }
}
