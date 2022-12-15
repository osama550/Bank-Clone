import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/choose_bill/choose_bill.dart';
import 'package:project/modules/in_out_payment/history.dart';
import 'package:project/modules/qr/qr_screen.dart';
import 'package:project/modules/transfar_money/favorite_screen.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // appBar
                  buildLogo(context: context),
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

                                  // child: SleekCircularSlider(
                                  //   initialValue:100,
                                  //   max: 100,
                                  //   appearance: CircularSliderAppearance(
                                  //     infoProperties: InfoProperties(
                                  //     ),
                                  //     angleRange: 800,
                                  //     size: 180,customWidths: CustomSliderWidths(
                                  //       progressBarWidth: 10
                                  //   ),
                                  //     customColors: CustomSliderColors(
                                  //       dotColor: Colors.yellow,
                                  //       progressBarColor: Colors.yellow,
                                  //       trackColor: HexColor('#6F223675'),
                                  //     ),
                                  //   ),
                                  // ),

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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60,
                                      top: 60
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:35 ,
                                        onPressed: (){
                                          showDialog(
                                              context: context,
                                              builder:(BuildContext context){
                                                context=context;
                                                return  defaultLoading();

                                              },

                                          );

                                        },
                                        icon:const Image(
                                      image: AssetImage('images/icon1.png'),


                                    )
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 35,
                                      top: 115
                                  ),
                                  child: Text(
                                    'withdrawel',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50,
                                      top: 140
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:35 ,
                                        onPressed: (){
                                          navigateTo(context, FavoriteScreen());
                                        },
                                        icon:const Image(
                                          image: AssetImage('images/icon2.png'),
                                        )
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 40,
                                      top: 190
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

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 85,
                                      top: 215
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(

                                        color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:30 ,
                                        onPressed: (){
                                          navigateTo(context, QRScreen());
                                        },
                                        icon:const Image(
                                          image: AssetImage('images/icon3.png'),
                                        )
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 55,
                                      top: 262
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
                                      left: 55,
                                      top: 280
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 165,
                                      top: 255
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(

                                        color: HexColor('#D8A616'),
                                        borderRadius: BorderRadiusDirectional.circular(50)
                                    ),

                                    child: IconButton(
                                        iconSize:30 ,
                                        onPressed: (){
                                          navigateTo(context, ChoosingBill());
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
                                      top: 303
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
                                      top: 323
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
                                      onPressed: (){
                                        navigateTo(context, HistoryScreen());
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
                            onPressed: (){},
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
