import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit = AppCubit.get(context);
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
                                  height: 45.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.circular(20.0,),
                                    boxShadow: [
                                      BoxShadow(
                                        color: primaryColor.withOpacity(0.45),
                                        offset: const Offset(5,5),
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
                                    progressColor: Colors.amber,
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
                                        'Credit Account \$100,000',
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
                                  child: IconButton(
                                      iconSize:45 ,
                                      onPressed: (){},
                                      icon:const Image(
                                    image: AssetImage('images/Picture15.png'),


                                  )
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
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40,
                                      top: 135
                                  ),
                                  child: IconButton(
                                      iconSize:60 ,
                                      onPressed: (){},
                                    icon: const Image(
                                    image: AssetImage('images/Picture16.png'),
                                  ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60,
                                      top: 200
                                  ),
                                  child: IconButton(
                                      iconSize:75 ,
                                      onPressed: (){},
                                      icon: const Image(
                                    image: AssetImage('images/Picture17.png'),
                                  )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 135,
                                      top: 230
                                  ),
                                  child: IconButton(
                                      iconSize:60 ,
                                      onPressed: (){},
                                      icon: const Image(
                                    image: AssetImage('images/Picture16.png'),


                                  )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 210,
                                      top: 230,
                                  ),
                                  child: IconButton(
                                      iconSize:75 ,
                                      onPressed: (){},
                                      icon: const Image(
                                    image: AssetImage('images/Picture17.png'),
                                  )
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 20.0,
                          ),
                          child: FloatingActionButton(
                            backgroundColor: primaryColor,
                            onPressed: (){},
                            child: const Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 33.0,
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
