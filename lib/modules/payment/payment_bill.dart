import 'package:flutter/material.dart';
import 'package:project/components/colors/colors.dart';
import 'package:sizer/sizer.dart';

class PaymentBill extends StatelessWidget {
  const PaymentBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Electricity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Image.asset(
                    'images/Picture14.png',
                    width: 18.w,
                    height: 7.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(
              'images/Picture2.png',
              width: 20.w,
              height: 10.h,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Pay Electricity Bill',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              '''pay electricity bill safely , conveniently & easily .
         you can pay anytime and anywhere!''',
              style: TextStyle(
                fontSize: 10.sp
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Divider(
                color: Colors.grey.shade100,
                thickness: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
