// ignore_for_file: file_names

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grow_pet/constants/colors.dart';
import 'package:flutter/material.dart';

class DonationRequestCard extends StatefulWidget {
  final String imagepath, breed, gender, age, name, location;

  const DonationRequestCard(
      {Key? key,
      required this.imagepath,
      required this.age,
      required this.breed,
      required this.gender,
      required this.location,
      required this.name})
      : super(key: key);

  @override
  State<DonationRequestCard> createState() => _DonationRequestCardState();
}

class _DonationRequestCardState extends State<DonationRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 388.w,
          height: 348.h,
          child: Column(
            children: [
              Container(
                width: 390.w,
                height: 215.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9.r),
                        topRight: Radius.circular(9.r)),
                    image: DecorationImage(
                        image: NetworkImage(widget.imagepath),
                        fit: BoxFit.fitWidth)),
              ),
            ],
          ),
        ),
        Positioned(
            top: 160,
            child: Container(
              width: 388.w,
              height: 131.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9.r)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 19.h, bottom: 17.h, left: 17.w, right: 17.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(
                              height: 11.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 31.h,
                                  width: 72.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: const Color(0xffFFEBDD)),
                                  child: Center(
                                    child: Text(
                                      widget.gender,
                                      style: TextStyle(
                                          color: const Color(0xffFF9D55),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'RobotoRegular'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  height: 31.h,
                                  width: 72.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: const Color(0xffF3E0FF)),
                                  child: Center(
                                    child: Text(
                                      widget.breed,
                                      style: TextStyle(
                                          color: const Color(0xffC262FD),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'RobotoRegular'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  height: 31.h,
                                  width: 72.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: const Color(0xffFFE6E1)),
                                  child: Center(
                                    child: Text(
                                      "${widget.age} years",
                                      style: TextStyle(
                                          color: const Color(0xffFF8368),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'RobotoRegular'),
                                    ),
                                  ),
                                ),
                              ],
                            )
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
                                ))), // message icon
                      ],
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
