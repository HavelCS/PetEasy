// ignore_for_file: no_leading_underscores_for_local_identifiers, await_only_futures, unnecessary_null_comparison, prefer_is_empty

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/constants/categories.dart';
import 'package:grow_pet/constants/donations.dart';
import 'package:grow_pet/screens/details/adoption_details.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:grow_pet/screens/forms/adoption_form.dart';
import 'package:grow_pet/util/utils.dart';
import 'package:grow_pet/widgets/donationCard.dart';

class AdoptionScreen extends StatefulWidget {
  final String uid;
  const AdoptionScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<AdoptionScreen> createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  var userData = {};
  var username = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      userData = userSnap.data()!;
      username = userData['username'];
    } catch (e) {
      showSnackBar(
        e.toString(),
        context,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  final CollectionReference _adoptions =
      FirebaseFirestore.instance.collection('adoptions');
  int colorindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverAppBar(
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(left: 22.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const CustomDialogBox(
                              labeltext: 'Donate Blood',
                              title: 'Request donation',
                              subtitle: 'Please fill in all details below.',
                            );
                          }));
                        },
                        child: Container(
                          height: 40,
                          width: 134,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(62)),
                          child: const Center(
                            child: Text(
                              "+ req. donation",
                              style: TextStyle(
                                  color: pinkShade,
                                  fontFamily: 'RobotoRegular',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: const Color(0xffFAFAFA),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello $username,',
                        style: TextStyle(
                            fontFamily: 'RobotoRegular',
                            color: const Color(0xff45485B),
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
                SizedBox(
                  height: 41.h,
                ),
                StreamBuilder(
                    stream: _adoptions.snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return ListView.builder(
                            padding: const EdgeInsets.only(top: 0, bottom: 50),
                            itemCount: streamSnapshot.data!.docs.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              var donation = donations[index];
                              return GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                                age: documentSnapshot['age'],
                                                breed:
                                                    documentSnapshot['breed'],
                                                gender:
                                                    documentSnapshot['gender'],
                                                location: donation.location,
                                                name:
                                                    documentSnapshot['petName'],
                                                imagepath: documentSnapshot[
                                                    'petImage'],
                                                description: documentSnapshot[
                                                    'description'],
                                                ownerName: documentSnapshot[
                                                    'ownerName'],
                                                userpfp: donation.userpfp,
                                              )));
                                }),
                                child: DonationRequestCard(
                                    snap:
                                        streamSnapshot.data!.docs[index].data(),
                                    age: documentSnapshot['age'],
                                    breed: documentSnapshot['breed'],
                                    gender: documentSnapshot['gender'],
                                    location: donation.location,
                                    name: documentSnapshot['petName'],
                                    imagepath: documentSnapshot['petImage']),
                              );
                            }));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
