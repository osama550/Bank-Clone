import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:sizer/sizer.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Confirm Payment',
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(4, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundColor: HexColor('#DCDDE1'),
                                radius: 40.0,
                                child: const Center(
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                      'images/4.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Divider(
                              color: Colors.grey.shade100,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Amount(USD)',
                              answer: '\$5000',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Name',
                              answer: 'Osama Kamel',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Bank Account',
                              answer: '45798',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Schedule',
                              answer: 'Now',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Hours',
                              answer: 'Now',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Category',
                              answer: '45798',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Notes',
                              answer: 'Thank you  :)',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                              ],
                            ),

                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(30.0),
                        color: HexColor('#925766'),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor:Colors.white,
                              title:Center(
                                child:Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(40),
                                            child: CircleAvatar(
                                              radius: 60,
                                              backgroundColor: primaryColor,
                                            ),
                                          ),
                                          Image.asset('images/icon6.png'),
                                        ],
                                      ),
                                    ),
                                    Text('Bill Paid Successfully!',
                                        style:TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              content:  const Padding(
                                padding: EdgeInsets.only(
                                    left: 27
                                ),
                                child: Text(
                                  'Thank you for paying the bill',style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                ),
                              ),
                              actions: [
                                Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),color:primaryColor,
                                  ),
                                  child:MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                        'Close',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.white,
                                        )
                                    ),
                                  ) ,
                                )
                              ],
                              actionsPadding: const EdgeInsets.only(
                                right: 75,
                                bottom: 20,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Change',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  paymentButton(context: context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
// Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 20.w,
//                         ),
//                         child: Divider(
//                           color: Colors.grey.shade100,
//                           thickness: 1.8,
//                         ),
//                       ),
