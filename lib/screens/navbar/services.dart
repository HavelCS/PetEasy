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
                  ListView.builder(
                      padding: const EdgeInsets.only(top: 0, bottom: 80),
                      itemCount: donations.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: ((context, index) {
                        var donation = donations[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ServiceDetails(
                                  tags: const [
                                    'Grooming',
                                    'Haircut',
                                    'Training',
                                    'Pet Care',
                                    'Spa',
                                    'Nail cutting'
                                  ],
                                  description: donation.description,
                                );
                              },
                            ));
                          },
                          child: ServiceCard(
                              description: donation.description,
                              imagepath:
                                  'https://static.businessworld.in/article/article_extra_large_image/1529408175_0Gczo2_petsutra.jpg',
                              location: donation.location,
                              name: donation.petName),
                        );
                        // return GestureDetector(
                        //   onTap: (() {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => DetailsScreen(
                        //                   age: donation.age,
                        //                   breed: donation.breed,
                        //                   gender: donation.gender,
                        //                   location: donation.location,
                        //                   name: donation.petName,
                        //                   imagepath: donation.userpfp,
                        //                   description: donation.description,
                        //                   ownerName: donation.ownerName,
                        //                   userpfp: donation.userpfp,
                        //                 )));
                        //   }),
                        //   child: DonationRequestCard(
                        //     age: donation.age,
                        //     breed: donation.breed,
                        //     gender: donation.gender,
                        //     location: donation.location,
                        //     name: donation.petName,
                        //     imagepath: donation.userpfp,
                        //   ),
                        // );
                      }))
                ],
              ),
            ),
          )),
    );
  }
}
