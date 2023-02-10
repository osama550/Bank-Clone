import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/Confirm%20Payment/Confirm%20Payment_Screen.dart';
import 'package:sizer/sizer.dart';

class transfarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
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
                          screenTitle: 'Transfer Money',
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'images/4.jpg',
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Osama Kamel',
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
                        defaultTextFormNumber(text: '''EG ${cubit.transferResult}''')
                      ],
                    ),
                  ),
                ),
                defaultNumbers(
                  amount: cubit.transferResult,
                  context: context,
                  id: 2,
                  onPressed: (){
                    navigateTo(context, ConfirmPaymentScreen());
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



//'''\$${cubit.transferResult}''',