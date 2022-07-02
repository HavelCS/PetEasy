// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers, unused_field

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_pet/provider/user_provider.dart';
import 'package:grow_pet/resource/firestore_method.dart';
import 'package:grow_pet/screens/navbar/navbar.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:grow_pet/util/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ServiceForm extends StatefulWidget {
  final String labeltext;
  final String title, subtitle;
  const ServiceForm(
      {Key? key,
      required this.labeltext,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  TextEditingController petCareCenterName = TextEditingController();

  TextEditingController serviceTags = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isLoading = false;
  Uint8List? _file;
  Uint8List? _list;
  final services = ['Spa', 'Food', 'Salon', 'Training', 'Hospital'];
  String? serviceType;

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  _selectPricingList(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _list = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _list = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void postImage(
    String uid,
    String username,
  ) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadServices(
          uid: uid,
          username: username,
          description: description.text,
          shopImage: _file!,
          tags: ['hair', 'spa', 'huehue', 'everything'],
          serviceType: serviceType,
          petCareName: petCareCenterName.text);
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          'Posted!',
          context,
        );
        clearImage();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ButtonNavBar();
        }));
      } else {
        showSnackBar(
          res,
          context,
        );
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        err.toString(),
        context,
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
      _list = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    petCareCenterName.dispose();

    serviceTags.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider _user = Provider.of<UserProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 33.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoading
                        ? const LinearProgressIndicator()
                        : Text(widget.title,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'RobotoRegular')),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(widget.subtitle,
                        style: TextStyle(
                            color: const Color(0xff7D8E9A),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'RobotoRegular'))
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                TextFieldDialog(
                    hinttext: 'Name', controller: petCareCenterName),
                // drop down menu
                Container(
                  width: 350.w,
                  height: 59.h,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Colors.white,
                      border: Border.all(
                          width: 1.w, color: const Color(0xffE5E8F1))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        icon: const Icon(
                          FontAwesomeIcons.angleDown,
                          size: 15,
                          color: Color(0xff45485B),
                        ),
                        hint: Text('Service Type',
                            style: TextStyle(
                                color: const Color(0xff7D8893),
                                fontSize: 14.sp,
                                fontFamily: 'RobotoRegular',
                                fontWeight: FontWeight.w400)),
                        isExpanded: true,
                        value: serviceType,
                        items: services.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(() {
                              serviceType = value;
                            })),
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.h),
                  child: Container(
                    width: double.infinity,
                    height: 120.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.white,
                        border: Border.all(
                            width: 1.w, color: const Color(0xffE5E8F1))),
                    child: TextField(
                        controller: description,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 10.w),
                            border: InputBorder.none,
                            hintText: 'Service',
                            hintStyle: TextStyle(
                                color: const Color(0xff7D8893),
                                fontSize: 14.sp,
                                fontFamily: 'RobotoRegular',
                                fontWeight: FontWeight.w400))),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.h),
                  child: Container(
                    width: double.infinity,
                    height: 120.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.white,
                        border: Border.all(
                            width: 1.w, color: const Color(0xffE5E8F1))),
                    child: TextField(
                        controller: description,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 10.w),
                            border: InputBorder.none,
                            hintText: 'Description/special note',
                            hintStyle: TextStyle(
                                color: const Color(0xff7D8893),
                                fontSize: 14.sp,
                                fontFamily: 'RobotoRegular',
                                fontWeight: FontWeight.w400))),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: GestureDetector(
                        onTap: () => _selectPricingList(context),
                        child: Container(
                          alignment: Alignment.center,
                          width: 65.w,
                          height: 59.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffF7F8F9),
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  width: 1.w, color: const Color(0xffD4E3E7))),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0xff9BABB6),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      'Pricing list (optional)',
                      style: TextStyle(
                          color: const Color(0xff7D8893),
                          fontFamily: 'RobotoRegular',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: GestureDetector(
                        onTap: () => _selectImage(context),
                        child: Container(
                          alignment: Alignment.center,
                          width: 65.w,
                          height: 59.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffF7F8F9),
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  width: 1.w, color: const Color(0xffD4E3E7))),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0xff9BABB6),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      'Pet Image',
                      style: TextStyle(
                          color: const Color(0xff7D8893),
                          fontFamily: 'RobotoRegular',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 94.h,
                ),
                GestureDetector(
                  onTap: () {
                    postImage(
                      _user.getUser.uid,
                      _user.getUser.username,
                    );
                    //* List your Pet method
                  },
                  child: Container(
                    height: 58.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: pinkShade,
                        borderRadius: BorderRadius.circular(9.r)),
                    child: Center(
                      child: Text(
                        'List Your Service',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'ArialBold',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldDialog extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  const TextFieldDialog(
      {Key? key, required this.hinttext, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        width: 350.w,
        height: 59.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Colors.white,
            border: Border.all(width: 1.w, color: const Color(0xffE5E8F1))),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
                border: InputBorder.none,
                hintText: hinttext,
                hintStyle: TextStyle(
                    color: const Color(0xff7D8893),
                    fontSize: 14.sp,
                    fontFamily: 'RobotoRegular',
                    fontWeight: FontWeight.w400))),
      ),
    );
  }
}
