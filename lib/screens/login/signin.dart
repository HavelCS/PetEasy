// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/resource/auth_method.dart';
import 'package:grow_pet/screens/navbar/navbar.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:grow_pet/screens/login/signup.dart';
import 'package:grow_pet/util/utils.dart';
import 'package:grow_pet/widgets/textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().logInUser(
        email: _emailcontroller.text, password: _passwordcontroller.text);

    if (res == "success") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ButtonNavBar(),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32.0.h, bottom: 31.h),
                child: Center(
                  child: Text(
                    "Hello!",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 23.sp,
                        fontFamily: 'RobotoRegular'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 74.w, right: 87.w),
                child: Container(
                  height: 222.h,
                  width: 266.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/login_illustration.png"))),
                ),
              ),
              SizedBox(
                height: 49.h,
              ),
              TextFieldContainer(
                hinttext: 'Email Address',
                controller: _emailcontroller,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldContainer(
                hinttext: 'Password',
                controller: _passwordcontroller,
                isPass: true,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 18.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 250.w, right: 30.w),
                child: Text(
                  'Recover Password',
                  style: TextStyle(
                      color: pinkShade,
                      fontSize: 14.sp,
                      fontFamily: 'HelveticaRegular'),
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.0.w),
                child: GestureDetector(
                  onTap: loginUser,
                  child: Container(
                    alignment: Alignment.center,
                    height: 58.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: pinkShade,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Let's Sign in now",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontFamily: 'ArialBold'),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Row(
                  children: [
                    const Image(image: AssetImage("assets/images/left.png")),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                            fontFamily: "RobotoRegular", fontSize: 14.sp),
                      ),
                    ),
                    const Image(image: AssetImage("assets/images/right.png"))
                  ],
                ),
              ),
              SizedBox(
                height: 44.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 53.w),
                child: Row(
                  children: [
                    Container(
                      height: 59.h,
                      width: 84.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(
                              color: const Color(0xffD3D3D3),
                              width: 1.w,
                              style: BorderStyle.solid),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/google.png"))),
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Container(
                      height: 59.h,
                      width: 84.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(
                              color: const Color(0xffD3D3D3),
                              width: 1.w,
                              style: BorderStyle.solid),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/facebook.png"))),
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Container(
                      height: 59.h,
                      width: 84.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(
                              color: const Color(0xffD3D3D3),
                              width: 1.w,
                              style: BorderStyle.solid),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/apple.png"))),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 49.h,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                    // ? navigate to the sign up screen
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff453E4E),
                            fontSize: 14.sp,
                            fontFamily: 'RobotoRegular'),
                      ),
                      Text(
                        'Create now',
                        style: TextStyle(
                            color: pinkShade,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'HelveticaRegular'),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
