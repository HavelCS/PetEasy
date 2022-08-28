// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grow_pet/provider/user_provider.dart';
import 'package:grow_pet/util/colors.dart';
import 'package:grow_pet/screens/navbar/chatscreen.dart';
import 'package:grow_pet/screens/navbar/adoption.dart';
import 'package:grow_pet/screens/navbar/listedpets.dart';
import 'package:grow_pet/screens/navbar/services.dart';
import 'package:grow_pet/screens/navbar/settings.dart';
import 'package:provider/provider.dart';

class ButtonNavBar extends StatefulWidget {
  const ButtonNavBar({Key? key}) : super(key: key);

  @override
  State<ButtonNavBar> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  int currentindex = 2;
  int pressedButtonNo = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const ListedPets(),
      const ListServices(),
      AdoptionScreen(
        uid: FirebaseAuth.instance.currentUser!.uid,
      ),
      const ChatScreen(),
      const SettingScreen(),
    ];
    final items = <Widget>[
      Icon(Icons.add,
          color:
              (pressedButtonNo == 0) ? Colors.white : const Color(0xffC4C4C4)),
      Icon(Icons.list,
          color:
              (pressedButtonNo == 1) ? Colors.white : const Color(0xffC4C4C4)),
      Icon(
        Icons.compare_arrows,
        color: (pressedButtonNo == 2) ? Colors.white : const Color(0xffC4C4C4),
      ),
      Icon(Icons.call_split,
          color:
              (pressedButtonNo == 3) ? Colors.white : const Color(0xffC4C4C4)),
      Icon(Icons.perm_identity,
          color:
              (pressedButtonNo == 4) ? Colors.white : const Color(0xffC4C4C4)),
    ];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: currentindex,
        height: 60.0,
        items: items,
        color: Colors.white, //navbar color
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: pinkShade,

        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentindex = index;
            pressedButtonNo = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: screens[currentindex],
    );
  }
}
