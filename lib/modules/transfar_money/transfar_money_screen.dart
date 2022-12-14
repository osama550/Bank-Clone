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


  // List of items in our dropdown menu
  var items = [
    'USD',
    'EGY',
    'CNY',
  ];
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
                          height: 30.0,
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
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 25,
                            end: 25,
                            top: 10,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            padding: EdgeInsetsDirectional.only(
                              top: 7,
                              bottom: 10,
                              start: 13,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                // color: primaryColor.withOpacity(0.5),
                                color: primaryColor.withOpacity(
                                  0.5,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: HexColor('#925766').withOpacity(0.5),
                                    ),
                                    height: 5.h,
                                    width: 30.w,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                            color: primaryColor,
                                          ),
                                          child: const Icon(
                                            Icons.attach_money_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),


                                        DropdownButton(
                                          value: AppCubit.get(context).dropdownvalue,
                                          icon: const Icon(Icons.keyboard_arrow_down),
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
// After selecting the desired option,it will
// change button value to selected value
                                          onChanged: (newValue) {
                                            AppCubit.get(context).dropDownValue(newValue );
                                          },
                                        ),
                                      ],
                                    )),
                                const Spacer(),
                                Text(
                                '''\$${cubit.transferResult}''',

                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
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



