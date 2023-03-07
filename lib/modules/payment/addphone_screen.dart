import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/payment/electricity_bill.dart';
import 'package:sizer/sizer.dart';

class AddPhoneScreen extends StatelessWidget {
  const AddPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is GetLodingpayInternet){
          defaultLoading();
        }
        else if(state is GetSucesspayInternet){
          navigateTo(context, ElectricityBillScreen());
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      buildAppBar(context: context, screenTitle: "Internet"),
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        'images/Picture3.png',
                        height: 100,
                        width: 100,
                      ),
                      DropdownButton(
                        // Initial Value
                        value: cubit.dropdownvalueOfInternet,
                        iconSize: 40,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: cubit.itemsOfInternet.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          return cubit.OnChangeItemInternet(newValue);
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        padding: EdgeInsets.only(left: 7.w),
                        child: Text(
                          ' Phone Number',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 25,
                          end: 25,
                          top: 5,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsetsDirectional.only(
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
                            cubit.phoneNumber,
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
                )),
                defaultNumbers(
                    amount: cubit.phoneNumber,
                    context: context,
                    id: 6,
                    onPressed: () {
                      if (cubit.phoneNumber == "0504114233" ||
                          cubit.phoneNumber == "05044247" ||
                          cubit.phoneNumber == "0504114234") {
                        cubit.payInternet(number: cubit.phoneNumber);
                        // if(state is GetSucesspayInternet){
                        //   navigateTo(context, ElectricityBillScreen());
                        // }
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => defaultErrorDialog(
                              context: context,
                              errorText: 'The Phone Number Is Wrong'),
                        );
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
