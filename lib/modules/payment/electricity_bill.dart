import 'package:flutter/material.dart';
import 'package:project/components/components.dart';

class ElectricitytBill extends StatelessWidget {
  const ElectricitytBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            paymentBill(
              context: context,
              screenTitle: 'Electricity',
              imagePath: 'images/Picture2.png',
              imageHeader: 'Pay Electricity Bill',
              payType: 'electricity',
            ),
            bill(
              price: '\$500',
              name: 'Islam Ahmed',
              bankAccount: '0552841664',
            ),
            paymentButton(context: context),

          ],
        ),
      ),
    );
  }
}
