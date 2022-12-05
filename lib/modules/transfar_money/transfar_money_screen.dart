import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/modules/Confirm%20Payment/Confirm%20Payment_Screen.dart';
import 'package:project/modules/payment/electricity_screen.dart';
import 'package:sizer/sizer.dart';

class transfarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildAppBar(
                      context: context,
                      screenTitle: 'Transfer Money',
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'images/4.jpg',
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Osama Kamel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Bank : 123456',
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
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
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 25,
                        end: 25,
                        top: 10,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: EdgeInsetsDirectional.only(
                          top: 7,
                          bottom: 10,
                          start: 13,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            // color: primaryColor.withOpacity(0.5),
                            color: primaryColor.withOpacity(
                              0.5,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: HexColor('#925766').withOpacity(0.5),
                                ),
                                height: 5.h,
                                width: 30.w,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: primaryColor,
                                      ),
                                      child: const Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'USD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 22,
                                    ),
                                  ],
                                )),
                            const Spacer(),
                            Text(
                              '\$1234',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            defaultNumbers(
              context: context,
              onPressed: (){
                navigateTo(context, ConfirmPaymentScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
