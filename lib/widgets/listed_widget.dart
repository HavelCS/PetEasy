import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/constants/colors.dart';

class ListedWidget extends StatelessWidget {
  final String imagepath, name, location;
  const ListedWidget(
      {Key? key,
      required this.imagepath,
      required this.location,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            width: 1.w,
            color: Colors.white,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 122.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                image: DecorationImage(
                  image: NetworkImage(imagepath),
                  fit: BoxFit.fitWidth,
                ),
              )),
          SizedBox(
            height: 9.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 10.w, bottom: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sola",
                  style: TextStyle(
                      color: const Color(0xff3F4765),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'RobotoRegular'),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 31.h,
                      width: 96.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: const Color(0xffF3E0FF)),
                      child: Text(
                        "Status: listed",
                        style: TextStyle(
                            color: pinkShade,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'RobotoRegular'),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 33.h,
                        width: 33.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: pinkShade),
                        child: const Icon(
                          Icons.mode_edit_outline_rounded,
                          color: Colors.white,
                          size: 15,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
