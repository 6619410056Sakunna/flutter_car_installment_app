import 'package:flutter/material.dart';
import 'package:flutter_car_installment_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

// เพิ่มส่วนนี้เข้าไปครับ
void main() {
  runApp(const FlutterCarInstallmentApp());
}

class FlutterCarInstallmentApp extends StatefulWidget {
  const FlutterCarInstallmentApp({super.key});

  @override
  State<FlutterCarInstallmentApp> createState() => _FlutterCarInstallmentAppState();
}

class _FlutterCarInstallmentAppState extends State<FlutterCarInstallmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}