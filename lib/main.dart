import 'package:flutter/material.dart';
import 'package:foodpanda_app/constats/color.dart';
import 'package:foodpanda_app/constats/constants.dart';
import 'package:foodpanda_app/dashboard/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Welcome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:  MyColors.navy,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xfffcfcfc),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 2,
          titleTextStyle: TextStyle(fontFamily: Bold , color: Color(0xff323232)),
          iconTheme: IconThemeData(color: MyColors.primaryColor)
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MyColors.navy,
        scaffoldBackgroundColor: const Color(0xfffcfcfc),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 2,
          titleTextStyle: TextStyle(fontFamily: Bold, color: Color(0xff323232)),
          iconTheme: IconThemeData(color: MyColors.primaryColor),
        )
      ),

    );
  }
}
