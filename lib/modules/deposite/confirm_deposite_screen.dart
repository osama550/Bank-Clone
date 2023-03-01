import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:sizer/sizer.dart';

class ConfirmDepositScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
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
                        screenTitle: 'Confirm Deposit',
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
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                      cubit.layoutModel!.clientPhoto.toString(),
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
                              answer: cubit.layoutModel!.clientName.toString(),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Bank Account',
                              answer: cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountId.toString(),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            paymentData(
                              title: 'Category',
                              answer: cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountType.toString(),
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
                    onPressed: ()async{
                      await cubit.userWithdrawal(
                        context: context,
                        transaction: 'deposit',
                        accountType: cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountType.toString(),
                        // amount: int.parse(cubit.withdrawelResult),
                        amount: 5000,
                        atm_id: 1,
                      );
                      cubit.getLayoutData();
                      showDialog(
                        context: context,
                        builder: (context) => defaultSuccessDialog(context),
                      );
                    },
                  ),
                  const SizedBox(
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
