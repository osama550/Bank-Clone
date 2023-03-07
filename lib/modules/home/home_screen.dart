import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/choose_bill/choose_bill.dart';
import 'package:project/modules/deposite/deposite_screen.dart';
import 'package:project/modules/in_out_payment/in_out_layout.dart';
import 'package:project/modules/qr/qr_screen.dart';
import 'package:project/modules/transfar_money/transfer_layout_screen.dart';
import 'package:project/modules/withdrawel/withdrawel_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit = AppCubit.get(context);
    if (cubit.speaker) {
      Timer(
        const Duration(seconds: 1),
            (){
          cubit.homeSpeaker(context: context);
          Timer(
            const Duration(seconds: 3),
              (){
                cubit.secondHomeSpeaker(context: context,);
              }
          );
        },
      );
    }

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        print('Value Of Back Variable In Cubit When Back From Deposit ${cubit.back2}');
        if(cubit.back2) {
          cubit.back2 = false;
          if (cubit.speaker) {
            cubit.secondHomeSpeaker(context: context,);
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
                    onPressed: () async{
                      cubit.listen(userSpeak: false,);
                      Navigator.pop(context,true);
                      // Timer(
                      //   const Duration(seconds: 1),
                      //     (){
                      //       cubit.layoutSpeaker(context: context,);
                      //     },
                      // );
                    },
                  ),
                  // Screen Body
                  SingleChildScrollView(
                    primary: true,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 25.0,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 50.h,
                                  height: 55.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.circular(20.0,),
                                    boxShadow: [
                                      BoxShadow(
                                        color: primaryColor.withOpacity(0.46),
                                        offset: const Offset(3,3),
                                        blurRadius: 15.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 60,
                                    left: 125,
                                  ) ,

                                  child: CircularPercentIndicator(
                                    radius: 90.0,
                                    backgroundColor: primaryColor.withOpacity(0.0),
                                    // backgroundColor: Colors.red,
                                    animation: true,
                                    animationDuration: 1500,
                                    progressColor: HexColor('#D8A616'),
                                    percent: 0.85,
                                    lineWidth: 12.0,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    backgroundWidth: 12.0,
                                    reverse: true,
                                    center: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: Text(
                                        // 'Credit Account \$100,000',
                                        '${cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountType}\n\$${cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountBalance}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if(cubit.userAccountIndex != 3)
                                  Padding(
                                  padding: const EdgeInsets.only(
                                      left: 100,
                                      top: 13
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:35 ,
                                        onPressed: ()async{
                                          cubit.listen(userSpeak: false,);
                                          cubit.back2 = await navigateTo(context, const DepositScreen());
                                        },
                                        icon:const Image(
                                          image: AssetImage('images/deposit.png'),
                                        )
                                    ),
                                  ),
                                ),
                                if(cubit.userAccountIndex != 3)
                                  const Padding(
                                  padding: EdgeInsets.only(
                                      left: 90,
                                      top: 63
                                  ),
                                  child: Text(
                                    'Deposit',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
/////////////////////////////////////////////////////////////////////////////////////////////////////

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 55,
                                      top: 87
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:35 ,
                                        onPressed: () async{
                                          cubit.listen(userSpeak: false,);
                                          cubit.back2 = await navigateTo(context, WithdrawelScreen());
                                        },
                                        icon:const Image(
                                      image: AssetImage('images/icon1.png'),
                                    )
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 30,
                                      top: 138
                                  ),
                                  child: Text(
                                    'withdrawal',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
////////////////////////////////////////////////////////////////////////////////////////////////////
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50,
                                      top: 165
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:35 ,
                                        onPressed: () async{
                                          cubit.listen(userSpeak: false,);
                                          cubit.searchuser();
                                          cubit.back2 = await navigateTo(context, TransferLayoutScreen());
                                        },
                                        icon:const Image(
                                          image: AssetImage('images/icon2.png'),
                                        )
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 45,
                                      top: 220
                                  ),
                                  child: Text(
                                    'transfer',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
/////////////////////////////////////////////////////////////////////////////////////////////////////
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 70,
                                      top: 242
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(

                                        color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:30 ,
                                        onPressed: () async {
                                          cubit.listen(userSpeak: false,);
                                          cubit.back2 = await navigateTo(context, const QRScreen());
                                        },
                                        icon:const Image(
                                          image: AssetImage('images/icon3.png'),
                                        )
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 48,
                                      top: 288
                                  ),
                                  child: Text(
                                    'payment of',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 48,
                                      top: 307
                                  ),
                                  child: Text(
                                    'purchases',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
///////////////////////////////////////////////////////////////////////////////////////////////////////
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 160,
                                      top: 275
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(

                                        color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:30 ,
                                        onPressed: () async{
                                          cubit.listen(userSpeak: false,);
                                          cubit.back2 = await navigateTo(context, ChoosingBill());
                                        },
                                        icon:const Image(
                                          image: AssetImage('images/icon4.png'),


                                        )
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 150,
                                      top: 325
                                  ),
                                  child: Text(
                                    'payment',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 160,
                                      top: 345
                                  ),
                                  child: Text(
                                    'of bills',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
///////////////////////////////////////////////////////////////////////////////////////////////////////
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 255,
                                    top: 235,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(

                                        color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                      iconSize:25 ,
                                      onPressed: () async{
                                        cubit.listen(userSpeak: false,);
                                        cubit.back2 = await navigateTo(context, InOutLayoutScreen());
                                      },
                                      icon:const Image(
                                        image: AssetImage('images/switch.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 250,
                                      top: 285
                                  ),
                                  child: Text(
                                    'In & Out',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 247,
                                      top: 300
                                  ),
                                  child: Text(
                                    'payment',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 320,
                            right: 10
                          ),
                          child: FloatingActionButton(
                            backgroundColor: primaryColor,
                            onPressed: () async{
                              cubit.listen(userSpeak: false,);
                              await cubit.launchPhoneDialer();
                            },
                            child: const Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //  Fixed Container in Bottom of Screen
                ],
              ),
            ),
            bottomSheet: buildBottomSheet(),
          ),
        );
      },
    );
  }
}
