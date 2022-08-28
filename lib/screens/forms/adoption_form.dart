// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_pet/provider/user_provider.dart';
import 'package:grow_pet/resource/firestore_method.dart';
import 'package:grow_pet/screens/navbar/navbar.dart';
import 'package:grow_pet/util/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CustomDialogBox extends StatefulWidget {
  final String labeltext;
  final String title, subtitle;
  const CustomDialogBox(
      {Key? key,
      required this.labeltext,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  TextEditingController petNameController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isLoading = false;
  Uint8List? _file;
  final petTypes = ['Dog', 'Cat', 'Bird', 'Rabbit', 'Hamster'];
  String? petType;
  final genders = ['Male', 'Female'];
  String? gender;

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
      String res = await FireStoreMethods().uploadAdoption(
        description.text,
        _file!,
        uid,
        username,
        ageController.text,
        breedController.text,
        gender!,
        petNameController.text,
        petType!,
      );
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
    });
  }

  @override
  void dispose() {
    super.dispose();
    petNameController.dispose();
    petTypeController.dispose();
    breedController.dispose();
    ageController.dispose();
    genderController.dispose();
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
                    hinttext: 'Pet’s name', controller: petNameController),
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
                        value: petType,
                        items: petTypes.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(() {
                              petType = value;
                            })),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldDialog(
                  hinttext: 'Pet species',
                  controller: breedController,
                ),
                TextFieldDialog(
                  hinttext: 'Age',
                  controller: ageController,
                ),
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
                        hint: Text('Gender',
                            style: TextStyle(
                                color: const Color(0xff7D8893),
                                fontSize: 14.sp,
                                fontFamily: 'RobotoRegular',
                                fontWeight: FontWeight.w400)),
                        isExpanded: true,
                        value: gender,
                        items: genders.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(() {
                              gender = value;
                            })),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.h),
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
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(9.r)),
                    child: Center(
                      child: Text(
                        'List Your Pet',
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
