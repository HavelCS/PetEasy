import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_pet/constants/colors.dart';

class DetailsScreen extends StatefulWidget {
  final String imagepath,
      breed,
      gender,
      age,
      name,
      location,
      description,
      ownerName,
      userpfp;
  const DetailsScreen(
      {Key? key,
      required this.age,
      required this.breed,
      required this.description,
      required this.gender,
      required this.imagepath,
      required this.location,
      required this.ownerName,
      required this.userpfp,
      required this.name})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 368.h,
              color: const Color(0xffFAFAFA),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 17.0.h, left: 20.w),
                    child: Container(
                      alignment: Alignment.center,
                      height: 37.h,
                      width: 37.w,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.r)),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                          size: 20,
                          color: Color(0xff3F4765),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20.w,
                      left: 20.w,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 282.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.imagepath)),
                          borderRadius: BorderRadius.circular(14.r)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                    color: const Color(0xff3F4765),
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'RobotoRegular'),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: const Color(0xff7D8893),
                                    size: 15.w,
                                  ),
                                  Text(
                                    widget.location,
                                    style: TextStyle(
                                        color: const Color(0xff9CA2BC),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'RobotoRegular'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                              height: 41.h,
                              width: 41.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: pinkShade),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    "assets/images/message.svg",
                                    width: 18.14.w,
                                    height: 16.93.h,
                                  ))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w, color: const Color(0xffE5E8F1)),
                              borderRadius: BorderRadius.circular(11.r)),
                          height: 86.h,
                          width: 120.w,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sex",
                                  style: TextStyle(
                                      color: const Color(0xff7D8893),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'RobotoRegular'),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  widget.gender,
                                  style: TextStyle(
                                      color: const Color(0xff3F4765),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'RobotoRegular'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w, color: const Color(0xffE5E8F1)),
                              borderRadius: BorderRadius.circular(11.r)),
                          height: 86.h,
                          width: 120.w,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Age",
                                  style: TextStyle(
                                      color: const Color(0xff7D8893),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'RobotoRegular'),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  widget.age,
                                  style: TextStyle(
                                      color: const Color(0xff3F4765),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'RobotoRegular'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w, color: const Color(0xffE5E8F1)),
                              borderRadius: BorderRadius.circular(11.r)),
                          height: 86.h,
                          width: 120.w,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Breed",
                                  style: TextStyle(
                                      color: const Color(0xff7D8893),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'RobotoRegular'),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  widget.breed,
                                  style: TextStyle(
                                      color: const Color(0xff3F4765),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'RobotoRegular'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(
                          wordSpacing: 2,
                          fontFamily: 'RobotoRegular',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff7F869E)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 83.h,
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 43.h,
                    width: 43.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.userpfp),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Owner",
                        style: TextStyle(
                            color: const Color(0xff7D8893),
                            fontFamily: 'RobotoRegular',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                      ),
                      Text(
                        widget.ownerName,
                        style: TextStyle(
                            color: const Color(0xffC562FD),
                            fontFamily: 'RobotoRegular',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                height: 46.h,
                width: 112.w,
                decoration: BoxDecoration(
                    color: pinkShade,
                    borderRadius: BorderRadius.circular(39.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/message.svg"),
                    SizedBox(
                      width: 9.2.w,
                    ),
                    Text(
                      "Contact",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'RobotoRegular',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
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
