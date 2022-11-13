import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/payment/electricity_bill.dart';
import 'package:sizer/sizer.dart';

class ServiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        paymentBill(
                          context: context,
                          screenTitle: cubit.bills[cubit.billIndex]['title'],
                          imagePath: cubit.bills[cubit.billIndex]['image'],
                          imageHeader: cubit.bills[cubit.billIndex]['title'],
                          payType: cubit.bills[cubit.billIndex]['title']
                              .toString()
                              .toLowerCase(),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          padding: EdgeInsets.only(left: 7.w),
                          child: Text(
                            'Bank Account',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 25,
                            end: 25,
                            top: 5,

                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsetsDirectional.only(
                              top: 7,
                              bottom: 10,
                              start: 13,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                            ),
                            child: Text(
                              '1234', style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,

                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //SizedBox(
                // height: 15.w,
                // ),
                SingleChildScrollView(
                  child: Container(
                    //width: 250.w,
                    //height: 100.w,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor('#c8abb3'),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('3',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('4',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('5',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('7',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('8',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('9',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.arrow_back, size: 35.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        ////////////////////////////////////

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: HexColor('#9E6F2236'),
                                  borderRadius: BorderRadiusDirectional
                                      .circular(15.0),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 12.0,
                                    ),
                                    child: Text(
                                        'X',
                                        style: TextStyle(
                                          color: HexColor('#6F2236'),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,)))),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 30,
                                right: 30,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor('#6F2236'),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  navigateTo(context, ElectricityBillScreen());
                                },
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.3),
//           spreadRadius: 3,
//           blurRadius: 6,
//           offset: Offset(4, 5), // changes position of shadow
//         ),
//       ],