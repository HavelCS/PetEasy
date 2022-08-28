import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_pet/model/user_model.dart';
import 'package:grow_pet/provider/user_provider.dart';
import 'package:grow_pet/resource/firestore_method.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:grow_pet/util/utils.dart';
import 'package:provider/provider.dart';

class ServiceDetails extends StatefulWidget {
  final List tags;
  final snap;

  const ServiceDetails({Key? key, this.snap, required this.tags})
      : super(key: key);

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  TextEditingController reviewController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    reviewController.dispose();
  }

  void postComment(
    String uid,
    String name,
  ) async {
    try {
      String res = await FireStoreMethods().postComment(
        widget.snap['postId'].toString(),
        reviewController.text,
        uid,
        name,
      );

      if (res != 'success') {
        // ignore: use_build_context_synchronously
        showSnackBar(
          res,
          context,
        );
      }
      setState(() {
        reviewController.text = "";
      });
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
    return Scaffold(
      backgroundColor: Colors.white,
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
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://images.ctfassets.net/f7tuyt85vtoa/6uYXdVLuYA80mmYCtg2Clp/fc550ed54760554ef04fbc4ff50d859e/Pet-care-COVER-whats-in-store-2021-ARTICLE.jpg'),
                              fit: BoxFit.cover),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.snap['petCareName'].toString(),
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
                                    'Location',
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
                          Row(
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
                                width: 6.w,
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      height: 53.h,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.tags.length,
                          itemBuilder: ((context, index) {
                            var text = widget.tags[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 9.0.w),
                              child: Container(
                                alignment: Alignment.center,
                                height: 43.h,
                                width: 108.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                        width: 1.w,
                                        color: const Color(0xffE5E8F1))),
                                child: Text(text),
                              ),
                            );
                          })),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      widget.snap['description'].toString(),
                      style: TextStyle(
                          wordSpacing: 2,
                          fontFamily: 'RobotoRegular',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff7F869E)),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    const Divider(color: Color(0xffE5E8F1), thickness: 1),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontFamily: 'RobotoRegular',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff3F4765)),
                        ),
                        Text('Give ratings',
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontFamily: 'RobotoRegular',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: pinkShade))
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xffE5E8F1), width: 1)),
                      child: TextField(
                        controller: reviewController,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () => postComment(
                                      user.uid,
                                      user.username,
                                    ),
                                child: const Icon(
                                  Icons.send,
                                  color: Color(0xff989DB1),
                                )),
                            contentPadding:
                                EdgeInsets.only(bottom: 21.h, left: 13.w),
                            hintText: 'write a review',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: const Color(0xff989DB1),
                                fontFamily: 'RobotoRegular',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    // StreamBuilder(
                    //   stream: FirebaseFirestore.instance
                    //       .collection('services')
                    //       .doc(widget.snap['postId'].toString())
                    //       .collection('comments')
                    //       .snapshots(),
                    //   builder: (context,
                    //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                    //           snapshot) {
                    //     if (snapshot.connectionState ==
                    //         ConnectionState.waiting) {
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }

                    //     return ListView.builder(
                    //       itemCount: snapshot.data!.docs.length,
                    //       itemBuilder: (ctx, index) => CommentCard(
                    //         snap: snapshot.data!.docs[index],
                    //       ),
                    //     );
                    //   },
                    // ),
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
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/550x/4f/8e/d0/4f8ed04344aab58f7f9c21a6891056fc.jpg'),
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
                        widget.snap['username'].toString(),
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
