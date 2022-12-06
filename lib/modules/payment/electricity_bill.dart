import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';

class ElectricityBillScreen extends StatelessWidget {
  const ElectricityBillScreen({Key? key}) : super(key: key);

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
                  paymentBill(
                    context: context,
                    screenTitle: cubit.bills[cubit.billIndex]['title'],
                    imagePath: cubit.bills[cubit.billIndex]['image'],
                    imageHeader: cubit.bills[cubit.billIndex]['title'],
                    payType: cubit.bills[cubit.billIndex]['title'].toString().toLowerCase(),
                  ),
                  bill(
                    price: '\$500',
                    name: 'Islam Ahmed',
                    bankAccount: '0552841664',
                  ),
                  paymentButton(
                    context: context,
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) => defaultSuccessDialog(context),
                      );
                    },
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
