import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/payment/addphone_screen.dart';
import 'package:project/modules/payment/select_electricity.dart';
import 'package:sizer/sizer.dart';

class ChoosingBill extends StatelessWidget {
   ChoosingBill({Key? key}) : super(key: key);

   bool back = false;

  @override
  Widget build(BuildContext context) {

    var cubit = AppCubit.get(context);

    void chooseBillSpeaker({
      required String message,
      int time = 4,
    }){
      cubit.speak(text: message);
      Timer(
        Duration(seconds: time),
            (){
          cubit.listen(userSpeak: true,);
          Timer(
              const Duration(seconds: 4),
                  () async{
                print('Bill is >>>>>> ${cubit.text}');
                if(cubit.text.contains('نت')) {
                  back = await navigateTo(context, AddPhoneScreen());
                }
                else if(cubit.text.contains('كهربا') || cubit.text.contains('نور')) {
                  back = await navigateTo(context, SelectElectricity());
                }
              }
          );
        },
      );
    }


    if (cubit.speaker){
      chooseBillSpeaker(message: 'تم اختيار الفواتير'
          '\n \n \n الرجاء اختيار نوع الخدمة');

    }
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (cubit.speaker) {
          if (back) {
            back = false;
            chooseBillSpeaker(
              message: 'الرجاء اختيار نوع الخدمة',
              time: 2,
            );
          }
        }

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // appBar
                  buildLogo(
                    context: context,
                    onPressed: (){
                      cubit.listen(userSpeak: false,);
                      Navigator.pop(context,true);
                    },
                  ),

                  // Screen Body
                  SingleChildScrollView(
                    primary: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  Bill',
                          style: TextStyle(
                            fontSize: 27.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildBillType(
                              context: context,
                              index: 0,
                              image: cubit.bills[0]['image'],
                              title: cubit.bills[0]['title'],
                            ),
                            buildBillType(
                              context: context,
                              index: 1,
                              image: cubit.bills[1]['image'],
                              title: cubit.bills[1]['title'],
                            ),
                            buildBillType(
                              context: context,
                              index: 2,
                              image: cubit.bills[2]['image'],
                              title: cubit.bills[2]['title'],
                            ),
                            buildBillType(
                              context: context,
                              index: 3,
                              image: cubit.bills[3]['image'],
                              title: cubit.bills[3]['title'],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildBillType(
                              context: context,
                              index: 4,
                              image: cubit.bills[4]['image'],
                              title: cubit.bills[4]['title'],
                            ),

                            buildBillType(
                              context: context,
                              index: 5,
                              image: cubit.bills[5]['image'],
                              title: cubit.bills[5]['title'],
                            ),

                            buildBillType(
                              context: context,
                              index: 6,
                              image: cubit.bills[6]['image'],
                              title: cubit.bills[6]['title'],
                            ),
                            buildBillType(
                              context: context,
                              index: 7,
                              image: cubit.bills[7]['image'],
                              title: cubit.bills[7]['title'],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildBillType(
                              context: context,
                              index: 8,
                              image: cubit.bills[8]['image'],
                              title: cubit.bills[8]['title'],
                            ),
                            buildBillType(
                              context: context,
                              index: 9,
                              image: cubit.bills[9]['image'],
                              title: cubit.bills[9]['title'],
                            ),
                            buildBillType(
                              context: context,
                              index: 10,
                              image: cubit.bills[10]['image'],
                              title: cubit.bills[10]['title'],
                            ),
                            buildBillType(
                              context: context,
                              index: 11,
                              image: cubit.bills[11]['image'],
                              title: cubit.bills[11]['title'],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60.0,
                        ),
                      ],
                    ),
                  ),
                  //  Fixed Container in Bottom of Screen
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: (){},
              child: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
            bottomSheet: buildBottomSheet(),
          ),
        );
      },
    );
  }
}
