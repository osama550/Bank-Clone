import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/payment/electricity_bill.dart';
import 'package:sizer/sizer.dart';

class SelectElectricity extends StatelessWidget {

  SelectElectricity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit = AppCubit.get(context);
    cubit.speak(text: 'تم اختيار خدمة الكهرباء');

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is GetLodingNumberOfElectricity){
          defaultLoading();
        }
        else if(state is GetSucessNumberOfElectricity){
          navigateTo(context, ElectricityBillScreen());
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
                        buildAppBar(
                          context: context,
                          screenTitle: "Electricity",
                          onPressed: (){
                            Navigator.pop(context,true,);
                            cubit.changeState();
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Image.asset(
                          'images/Picture2.png',
                          height: 100,
                          width: 100,
                        ),
                        DropdownButton(
                          // Initial Value
                          value: cubit.dropdownvalueOfElectricity,
                          iconSize: 40,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items:cubit.itemsOfElectricity.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            return cubit.OnChangeItemElectricity(newValue);
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          padding: EdgeInsets.only(left: 7.w),
                          child: Text(
                            ' Electricity meter number',
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
                              cubit.electricityMeterNumber,
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
                  amount: cubit.electricityMeterNumber,
                  context: context,
                  id: 5,
                  onPressed: () {
                    if (cubit.electricityMeterNumber == "444666" ||
                        cubit.electricityMeterNumber == "444776"){
                      cubit.CheckElectricity(
                         company: cubit.dropdownvalueOfElectricity,
                        number: cubit.electricityMeterNumber
                      );
                      // if(state is GetSucesspayInternet){
                      //   navigateTo(context, ElectricityBillScreen());
                      // }
                    }
                  },
                ),
//
              ],
            ),
          ),
        );
      },
    );
  }
}
