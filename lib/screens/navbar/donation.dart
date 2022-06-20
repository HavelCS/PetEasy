import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/constants/categories.dart';
import 'package:grow_pet/resource/auth_method.dart';
import 'package:grow_pet/screens/login/signin.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:grow_pet/constants/donations.dart';
import 'package:grow_pet/screens/navbar/details.dart';
import 'package:grow_pet/widgets/donationCard.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  String name = "";
  int colorindex = 0;

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  signout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverAppBar(
                  actions: [
                    IconButton(
                        onPressed: () async {
                          await AuthMethods().signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                              (route) => false);
                        },
                        icon: const Icon(
                          Icons.login_outlined,
                          color: Colors.black,
                        ))
                  ],
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: const Color(0xffFAFAFA),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello $name,",
                        style: TextStyle(
                            fontFamily: 'RobotoRegular',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ))
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 52.h,
                  width: 388.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: [
                      Container(
                        width: 317.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: TextField(
                          cursorColor: pinkShade,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 17.w, top: 13.h, bottom: 15.h),
                              hintText: 'Search pet...',
                              hintStyle: const TextStyle(
                                  fontSize: 14, fontFamily: 'RobotoRegular'),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                          width: 71.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF9D9D),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                    height: 38.h,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: ((context, index) {
                          var category = categories[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  colorindex = index;
                                });
                              },
                              child: Container(
                                height: 38.h,
                                width: 64.w,
                                decoration: BoxDecoration(
                                    color: (colorindex == index)
                                        ? const Color(0xffFEB877)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35)),
                                child: Center(
                                  child: Text(
                                    category.specie,
                                    style: TextStyle(
                                        color: (colorindex == index)
                                            ? Colors.white
                                            : const Color(0xff5F657F),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'RobotoRegular'),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }))),
                ListView.builder(
                    itemCount: donations.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      var donation = donations[index];
                      return GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        age: donation.age,
                                        breed: donation.breed,
                                        gender: donation.gender,
                                        location: donation.location,
                                        name: donation.petName,
                                        imagepath: donation.userpfp,
                                        description: donation.description,
                                        ownerName: donation.ownerName,
                                        userpfp: donation.userpfp,
                                      )));
                        }),
                        child: DonationRequestCard(
                          age: donation.age,
                          breed: donation.breed,
                          gender: donation.gender,
                          location: donation.location,
                          name: donation.petName,
                          imagepath: donation.userpfp,
                        ),
                      );
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
