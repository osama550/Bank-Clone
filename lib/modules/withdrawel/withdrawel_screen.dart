import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/withdrawel/withdrawel_Payment_screen.dart';
import 'package:sizer/sizer.dart';

class WithdrawelScreen extends StatelessWidget {

  bool back = true;


  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    if(cubit.speaker) {
      Timer(
        const Duration(seconds: 1),
            (){
          cubit.speak(text: 'تم إختيار عملية السَحب '
              '\n \n \n الرجاء وضع المبلغ');
          Timer(
            const Duration(seconds: 4),
                () async{
              cubit.listen(userSpeak: true);
              print('Here cubit text  1 ===========> ${cubit.text}');

              Timer(
                const Duration(seconds: 6),
                    (){
                  cubit.getWithdrawal(
                    context: context,
                    message: cubit.text,
                    value: back,
                  );
                  // navigateTo(context, WithdrawelPaymentScreen());
                  print('index ==========> ${cubit.userAccountIndex}');
                  print('Here cubit text  2  ===========> ${cubit.text}');
                },
              );
            },
          );
        },
      );
    }

    return  BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){
        print(back);
      },
      builder: (context, state){
        if (back) {
          back = false;
          if(cubit.speaker) {
            Timer(
              const Duration(seconds: 1),
                  (){
                cubit.speak(text: 'تم إختيار عملية السَحب '
                    '\n \n \n الرجاء وضع المبلغ');
                Timer(
                  const Duration(seconds: 4),
                      () async{
                    cubit.listen(userSpeak: true);
                    print('Here cubit text  1 ===========> ${cubit.text}');

                    Timer(
                      const Duration(seconds: 6),
                          ()async{
                        cubit.getWithdrawal(
                          context: context,
                          message: cubit.text,
                          value: back,
                        );
                        if (cubit.withdrawelResult != '') {
                          back = await navigateTo(context, WithdrawelPaymentScreen());

                        }
                        // navigateTo(context, WithdrawelPaymentScreen());
                        print('index ==========> ${cubit.userAccountIndex}');
                        print('Here cubit text  2  ===========> ${cubit.text}');
                      },
                    );
                  },
                );
              },
            );
          }
        }
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
                          screenTitle: 'Withdrawal',
                          id: 4,
                          onPressed: (){
                            cubit.listen(userSpeak: false,);
                            Navigator.pop(context,true,);
                          },
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
                          '${cubit.layoutModel!.clientName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Bank : ${cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountId}',
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
                        defaultTextFormNumber(
                            text: "EG ${cubit.withdrawelResult}",
                        ),
                      ],
                    ),
                  ),
                ),
                defaultNumbers(
                  amount: cubit.withdrawelResult,
                  context: context,
                  id: 4,
                  onPressed: (){
                    if (cubit.withdrawelResult != '') {
                      navigateTo(context, WithdrawelPaymentScreen());
                    }
                    else{
                      defaultErrorDialog(
                        context: context,
                        errorText: 'Sorry, you have to enter the amount you want to withdraw first',
                      );
                    }
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
