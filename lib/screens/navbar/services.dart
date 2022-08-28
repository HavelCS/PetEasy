import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/constants/donations.dart';
import 'package:grow_pet/constants/petcare.dart';
import 'package:grow_pet/screens/details/service_details.dart';
import 'package:grow_pet/screens/forms/service_form.dart';
import 'package:grow_pet/widgets/serviceCard.dart';

class ListServices extends StatefulWidget {
  const ListServices({Key? key}) : super(key: key);

  @override
  State<ListServices> createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  final CollectionReference _adoptions =
      FirebaseFirestore.instance.collection('services');
  int colorindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                SliverAppBar(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return const ServiceForm(
                                labeltext: 'List your services',
                                subtitle:
                                    'Please fill in all details below to list your pet for adoption',
                                title: 'List your service',
                              );
                            })));
                          },
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFF9D9D)),
                            child: const Icon(Icons.add),
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
                          "Pet Care",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'RobotoRegular',
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Lucknow, Uttar Pradesh",
                          style: TextStyle(
                              color: const Color(
                                0xff7D8893,
                              ),
                              fontFamily: 'RobotoRegular',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                        )
                      ],
                    ))
              ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                      height: 38.h,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: services.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            var service = services[index];
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
                                      service.service,
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
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                              padding:
                                  const EdgeInsets.only(top: 0, bottom: 80),
                              itemCount: streamSnapshot.data!.docs.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: ((context, index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[index];
                                var donation = donations[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ServiceDetails(
                                          snap: streamSnapshot.data!.docs[index]
                                              .data(),
                                          tags: const [
                                            'Grooming',
                                            'Haircut',
                                            'Training',
                                            'Pet Care',
                                            'Spa',
                                            'Nail cutting'
                                          ],
                                        );
                                      },
                                    ));
                                  },
                                  child: ServiceCard(
                                    description:
                                        documentSnapshot['description'],
                                    imagepath: documentSnapshot['shopImage'],
                                    location: donation.location,
                                    name: documentSnapshot['petCareName'],
                                  ),
                                );
                              }));
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ],
              ),
            ),
          )),
    );
  }
}
