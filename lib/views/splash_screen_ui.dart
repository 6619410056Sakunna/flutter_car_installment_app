import 'package:flutter/material.dart';
import 'package:flutter_car_installment_app/views/car_installment_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CarInstallmentUi(),
        ),
      );
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(187, 121, 235, 46),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/car.png',
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.width * 0.50,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            Text(
              'Car Installment \n คำนวณค่างวดรถยนต์',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 37, 33, 33),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            CircularProgressIndicator(
              color: const Color.fromARGB(255, 37, 33, 33),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Created by Sakunna \n Version 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 37, 33, 33),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
