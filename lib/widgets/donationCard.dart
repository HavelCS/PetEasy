// ignore_for_file: file_names

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grow_pet/model/user_model.dart';
import 'package:grow_pet/resource/firestore_method.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:grow_pet/util/utils.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class DonationRequestCard extends StatefulWidget {
  final String imagepath, breed, gender, age, name, location;
  final snap;

  const DonationRequestCard(
      {Key? key,
      required this.imagepath,
      required this.age,
      required this.breed,
      required this.gender,
      required this.location,
      required this.name,
      required this.snap})
      : super(key: key);

  @override
  State<DonationRequestCard> createState() => _DonationRequestCardState();
}

class _DonationRequestCardState extends State<DonationRequestCard> {
  deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      showSnackBar(
        err.toString(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
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
                child: widget.snap['uid'].toString() == user.uid
                    ? IconButton(
                        onPressed: () {
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete',
                                    ]
                                        .map(
                                          (e) => InkWell(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                              onTap: () {
                                                deletePost(
                                                  widget.snap['postId']
                                                      .toString(),
                                                );
                                                // remove the dialog box
                                                Navigator.of(context).pop();
                                              }),
                                        )
                                        .toList()),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.more_vert,
                          size: 20,
                          color: Colors.red,
                        ),
                      )
                    : Container(),
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
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
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
