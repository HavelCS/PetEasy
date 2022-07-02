import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/constants/listedpets.dart';
import 'package:grow_pet/widgets/listed_widget.dart';

class ListedPets extends StatefulWidget {
  const ListedPets({Key? key}) : super(key: key);

  @override
  State<ListedPets> createState() => _ListedPetsState();
}

class _ListedPetsState extends State<ListedPets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                width: 40.h,
                decoration: const BoxDecoration(
                    color: Color(0xffFF9D9D), shape: BoxShape.circle),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
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
                "Listed pets",
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
                "here are pets that you have listed for donation",
                style: TextStyle(
                    color: const Color(
                      0xff7D8893,
                    ),
                    fontFamily: 'RobotoRegular',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp),
              )
            ],
          )),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: listedpets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (185.w / 215.h),
              mainAxisSpacing: 19.h,
              crossAxisSpacing: 18.w,
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            var listedpet = listedpets[index];
            return ListedWidget(
              imagepath: listedpet.userpfp,
              location: listedpet.location,
              name: listedpet.petName,
            );
          },
        ),
      ),
    );
  }
}
