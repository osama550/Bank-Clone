import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';

class ElectricityBillScreen extends StatelessWidget {
  const ElectricityBillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit = AppCubit.get(context);
    var model;
    if(cubit.billIndex == 0){
      model = cubit.electricityModel;
    }
    else if(cubit.billIndex == 1){
      model = cubit.internetModel;
    }

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    price: '\$${model.amount}',
                    name: '${model.name}',
                    status: '${model.status}',
                    bankAccount: '${cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountId}',
                  ),
                  paymentButton(
                    context: context,
                    disabled: cubit.internetModel!.status == 'paid' ? true : false,
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
