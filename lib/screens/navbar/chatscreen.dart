import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grow_pet/constants/chats.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:grow_pet/widgets/messageCard.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
                  child: SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 23.0.w, right: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Messages',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25.sp,
                                fontFamily: 'RobotoRegular',
                                color: const Color(0xff3F4765)),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 39.h,
                                width: 39.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffE5E8F1),
                                        width: 1.w),
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.notifications,
                                  color: pinkShade,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Container(
                                height: 39.h,
                                width: 39.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80"),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: const Color(0xffECEDEE),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 23.w, right: 22.w, top: 23.h, bottom: 29.h),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(31.r),
                        border: Border.all(
                            color: const Color(0xffE5E8F1), width: 1.w)),
                    child: TextField(
                      cursorColor: pinkShade,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 0.w, top: 13.h, bottom: 13.h),
                              child: SvgPicture.asset(
                                "assets/images/vectorsearch.svg",
                                height: 10.h,
                                width: 10.h,
                                color: const Color(0xffFF9D9D),
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 17.w, bottom: 10.h, top: 8.h),
                          hintText: 'Search pet...',
                          hintStyle: TextStyle(
                              fontSize: 14.sp, fontFamily: 'RobotoRegular'),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: chatsData.length,
                  itemBuilder: (context, index) {
                    var chat = chatsData[index];
                    return MessagesCard(
                      imagepath: chat.pfp,
                      lastMessage: chat.lastMessage,
                      name: chat.name,
                      time: chat.time,
                    );
                  },
                ),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
