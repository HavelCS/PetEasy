import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesCard extends StatefulWidget {
  final String imagepath;
  final String name;
  final String lastMessage;
  final String time;
  const MessagesCard(
      {Key? key,
      required this.imagepath,
      required this.lastMessage,
      required this.name,
      required this.time})
      : super(key: key);

  @override
  State<MessagesCard> createState() => _MessagesCardState();
}

class _MessagesCardState extends State<MessagesCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(bottom: 25.h, right: 24.w, left: 23.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 41.h,
                      width: 41.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(widget.imagepath),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'RobotoRegular',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              widget.lastMessage,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'RobotoRegular',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff85939C),
                                fontSize: 14.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 80.w,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 26.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0.w),
                  child: Container(
                    width: double.infinity,
                    height: 1.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1.w,
                      color: const Color(0xffD4E3E7),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 300,
            child: Text(
              "12:38 AM",
              style: TextStyle(
                  color: const Color(0xff7F869E),
                  fontFamily: 'RobotoFamily',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ))
      ],
    );
  }
}
