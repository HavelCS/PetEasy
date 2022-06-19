// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/constants/colors.dart';
import 'package:grow_pet/screens/navbar/navbar.dart';
import 'package:grow_pet/widgets/textfield.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  var purpleshadecolor = pinkShade;
  final controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(
                "assets/images/adoptionbackground.png",
              )),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 39.0),
                      child: Center(
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80"),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      color: pinkShade, shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 54.h,
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
                      height: 50.h,
                    ),
                    TextFieldContainer(
                      hinttext: 'User Name',
                      controller: usernamecontroller,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFieldContainer(
                      hinttext: 'Email Address',
                      controller: emailcontroller,
                      isPass: true,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFieldContainer(
                      hinttext: 'Password',
                      controller: passwordcontroller,
                      textInputType: TextInputType.text,
                    ),

                    // TextFields add hongi
                    Padding(
                      padding: EdgeInsets.only(
                        top: 55.h,
                      ),
                      child: Row(
                        children: [
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ButtonNavBar()),
                              );
                            },
                            child: Container(
                                height: 58,
                                width: 148,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(width: 1, color: pinkShade)),
                                child: const Center(
                                  child: Text(
                                    "Go to Home",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: pinkShade,
                                        fontFamily: 'RobotoRegular'),
                                  ),
                                )),
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                purpleshadecolor = const Color(0xffEAC9FE);
                              });
                            },
                            child: Container(
                                height: 58,
                                width: 148,
                                decoration: BoxDecoration(
                                    color: purpleshadecolor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        width: 1, color: purpleshadecolor)),
                                child: const Center(
                                  child: Text(
                                    "Save Changes",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'RobotoRegular'),
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
