import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/screens/welcome/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(495, 1078),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tesla App',
          //theme: ThemeData.dark(),
          home: child,
        );
      },
      child: const WelcomeScreen(),
    );

  }
}
