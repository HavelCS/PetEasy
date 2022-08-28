import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_pet/util/colors.dart';

class ServiceCard extends StatefulWidget {
  final String imagepath;
  final String name;
  final String location;
  final String description;

  const ServiceCard(
      {Key? key,
      required this.description,
      required this.imagepath,
      required this.location,
      required this.name})
      : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: 388.w,
        height: 420.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.r),
        ),
        child: Column(
          children: [
            Container(
              width: 384.w,
              height: 240.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.r),
                  image: DecorationImage(
                      image: NetworkImage(widget.imagepath), fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 5.h,
              width: 5.w,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: pinkShade),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 163.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                    color: const Color(0xff3F4765),
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'RobotoRegular'),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xff7D8893),
                                    size: 15,
                                  ),
                                  Text(
                                    widget.location,
                                    style: TextStyle(
                                        color: const Color(0xff9CA2BC),
                                        fontFamily: 'RobotoRegular',
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ), //* NAME OF PLACE AND LOCATION
                        Container(
                          child: Row(
                            children: [
                              Container(
                                  width: 41.w,
                                  height: 41.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffFEB877)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "5",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'RobotoRegular',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.solidStar,
                                        color: Colors.white,
                                        size: 13,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                width: 10.w,
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
                        ), //* ACTION BUTTONS
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    child: Text(
                      widget.description,
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: 'RobotoRegular',
                          letterSpacing: 0.2,
                          color: const Color(0xff45485B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
