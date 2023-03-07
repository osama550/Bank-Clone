import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/deposite/confirm_deposite_screen.dart';
import 'package:sizer/sizer.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    if(cubit.speaker) {
      Timer(
        const Duration(seconds: 1),
            (){
          cubit.speak(text: 'تم إختيار عملية الإيداع '
              '\n \n \n الرجاء وضع المبلغ');
        },
      );
    }

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        if (cubit.back3) {
          cubit.back3 = false;
          if(cubit.speaker) {
            Timer(
              const Duration(seconds: 1),
                  (){
                cubit.speak(text: 'تم إختيار عملية الإيداع '
                    '\n \n \n الرجاء وضع المبلغ');
              },
            );
          }
        }
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          buildAppBar(
                            context: context,
                            screenTitle: 'Deposit',
                            onPressed: (){
                              cubit.changeState();
                              Navigator.pop(context,true);
                            }
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(cubit.layoutModel!.clientPhoto.toString()),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            cubit.layoutModel!.clientName.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: primaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 5.h),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 6,
                                    offset: const Offset(
                                        4, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    const Center(
                                      child: CircleAvatar(
                                        radius: 50.0,
                                        backgroundColor: Colors.orangeAccent,
                                        child: Center(
                                            child: Image(
                                          image: AssetImage('images/cash.png'),
                                          color: Colors.white,
                                          height: 70,
                                          width: 70,
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40.0,
                                    ),
                                    const Center(
                                      child: Text(
                                        'Please,put your cash',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  paymentButton(
                    context: context,
                    text: 'Continue',
                    onPressed: () async{
                      cubit.back3 = await navigateTo(context, const ConfirmDepositScreen());
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => defaultErrorDialog(
                      //     context: context,
                      //     errorText: 'Error!!!!!',
                      //   ),
                      // );
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
