import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/screens/login/signin.dart';
import 'package:grow_pet/screens/onboarding/onboardingcontent.dart';
import 'package:grow_pet/util/colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
    return Scaffold(
      body: Column(
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
                          decoration: const BoxDecoration(
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
                                    color: const Color(0xff909090),
                                    fontSize: 14.sp,
                                    fontFamily: 'HelveticaRegular'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                (index) => buildDot(index, context),
                              ),
                            ),
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
              padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 38.h),
              child: InkWell(
                onTap: () async {
                  if (currentIndex == contents.length - 1) {
                    // await _storeOnboardInfo();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  }

                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 346.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                      color: pinkShade, borderRadius: BorderRadius.circular(7)),
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
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6.h,
      width: currentIndex == index ? 6.w : 6.w,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: currentIndex == index
              ? const Color(0xffC262FD)
              : const Color(0xffE0E0E0)),
    );
  }
}
