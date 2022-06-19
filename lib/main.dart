import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_pet/screens/login/signin.dart';
import 'package:grow_pet/screens/splash/onboardingsplash.dart';

import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1); //if already shown -> 1 else 0
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: ((context, child) {
          return MaterialApp(
            title: 'Flutter OnBoarding Screen',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute:
                initScreen == 0 || initScreen == null ? 'onboard' : 'home',
            routes: {
              'home': (context) => const SignInScreen(),
              'onboard': (context) => const OnBoardingSplashScreen(),
            },
          );
        }));
  }
}
