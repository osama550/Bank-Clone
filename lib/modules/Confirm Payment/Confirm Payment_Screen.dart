import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/network/remote/dio_helper.dart';
import 'package:sizer/sizer.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  String? image;
  String? result;
  String? name;
  String? accountNumber;
  ConfirmPaymentScreen({
    this.image,
    this.result,
    this.name,
    this.accountNumber,
  });
  @override
  Widget build(BuildContext context) {

    var cubit = AppCubit.get(context);


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
                      buildAppBar(
                        context: context,
                        screenTitle: 'Confirm Payment',
                        onPressed: (){
                          Navigator.pop(context,true,);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
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
                            Center(
                              child: CircleAvatar(
                                backgroundColor: HexColor('#DCDDE1'),
                                radius: 40.0,
                                child:  Center(
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage('$image'),
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
                              answer: '\$${result}',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Name',
                              answer: '$name',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Bank Account',
                              answer: '$accountNumber',
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
                              answer: '${cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountType!}',
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
                  paymentButton(
                    context: context,
                    onPressed: () async {
                      cubit.transferMoney(
                        account_type: cubit
                            .layoutModel!
                            .clientAccounts[cubit.userAccountIndex]
                            .accountType!,
                        type: 'bank',
                        transfer_to: 5,
                        amount: 1000,
                      );
                      showDialog(
                        context: context,
                        builder: (context) => defaultErrorDialog(
                          context: context,
                          errorText: 'Error!!!!!',
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
