import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/withdrawel/withdrawel_Payment_screen.dart';
import 'package:sizer/sizer.dart';

class WithdrawelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildAppBar(
                          context: context,
                          screenTitle: 'Withdrawal',
                          id: 4,
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
                    navigateTo(context, WithdrawelPaymentScreen());
                    // cubit.userWithdrawal(
                    //   context: context,
                    //   transaction: 'withdrawal',
                    //   accountType: cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountType.toString(),
                    //   amount: int.parse(cubit.withdrawelResult),
                    //   atm_id: int.parse(cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountId.toString()),
                    // );
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
