import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
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
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        paymentBill(
                            context: context,
                            screenTitle: ('Electricity'),
                            imagePath: 'images/Picture2.png',
                            imageHeader: 'Pay Electricity Bill',
                            payType: ('Electricity')),
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
                              border: Border.all(
                                width: 2,
                                color: primaryColor.withOpacity(
                                  0.5,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                             result,
                              style: TextStyle(
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
                defaultNumbers(
                  context: context,
                  onPressed: (){
                    navigateTo(context, ElectricityBillScreen());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}