// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarInstallmentUi extends StatefulWidget {
  const CarInstallmentUi({super.key});

  @override
  State<CarInstallmentUi> createState() => _CarInstallmentUiState();
}

class _CarInstallmentUiState extends State<CarInstallmentUi> {
  @override
  void dispose() {
    carPriceCtrl.dispose();
    interestRateCtrl.dispose();
    super.dispose();
  }

  TextEditingController carPriceCtrl = TextEditingController();
  TextEditingController interestRateCtrl = TextEditingController();

  int selectedDownPayment = 10;
  String selectedLoanPeriod = '24 เดือน';
  double monthlyInstallment = 0.0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.lightGreen[600],
              child: Center(
                child: Text(
                  'CI Calculator',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 37, 33, 33),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      'คำนวณค่างวดรถ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/cars.jpeg',
                        width: 200,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ราคารถ (บาท)',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: carPriceCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรอกราคารถ',
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'จำนวนเงินดาวน์ (%)',
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [10, 20, 30, 40, 50].map((int value) {
                        return Row(
                          children: [
                            Radio<int>(
                              value: value,
                              groupValue: selectedDownPayment,
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedDownPayment = newValue!;
                                });
                              },
                            ),
                            Text(value.toString()),
                          ],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ระยะเวลาผ่อน (เดือน)',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        value: selectedLoanPeriod,
                        isExpanded: true,
                        underline: SizedBox(),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        items: [
                          '24 เดือน',
                          '36 เดือน',
                          '48 เดือน',
                          '60 เดือน',
                          '72 เดือน'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLoanPeriod = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'อัตราดอกเบี้ย (%/ปี)',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: interestRateCtrl,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '0.00',
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate input
                              if (carPriceCtrl.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('กรุณากรอกราคารถ'),
                                  ),
                                );
                                return;
                              }
                              if (interestRateCtrl.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('กรุณากรอกอัตราดอกเบี้ย'),
                                  ),
                                );
                                return;
                              }

                              // Get values
                              double carPrice = double.parse(carPriceCtrl.text);
                              double interestRate =
                                  double.parse(interestRateCtrl.text);
                              int loanMonths =
                                  int.parse(selectedLoanPeriod.split(' ')[0]);

                              // Calculate
                              double downPaymentAmount =
                                  (carPrice * selectedDownPayment) / 100;
                              double loanAmount = carPrice - downPaymentAmount;
                              double totalInterest =
                                  (loanAmount * interestRate / 100) *
                                      (loanMonths / 12);
                              double totalAmount = loanAmount + totalInterest;
                              double monthly = totalAmount / loanMonths;

                              setState(() {
                                monthlyInstallment = monthly;
                              });
                            },
                            child: Text('คำนวณ'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen[600],
                              textStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                carPriceCtrl.clear();
                                interestRateCtrl.clear();
                                monthlyInstallment = 0.0;
                                selectedDownPayment = 10;
                                selectedLoanPeriod = '24 เดือน';
                              });
                            },
                            child: Text('ยกเลิก'),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'ค่างวดต่อเดือน',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              NumberFormat('#,##0.00', 'en_US').format(monthlyInstallment),
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[600],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'บาทต่อเดือน',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
