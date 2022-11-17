import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:sizer/sizer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 15.0,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: 50.h,
                              height: 45.h,
                              color: HexColor('#9E6F2236'),
                            ),
                            Container(
                              padding:EdgeInsets.only(
                                top: 72,
                                left: 110,

                              ) ,
                              child: SleekCircularSlider(
                                initialValue:20 ,
                                max: 100,
                                appearance: CircularSliderAppearance(
                                  infoProperties: InfoProperties(

                                  ),
                                  angleRange: 800,
                                  size: 180,customWidths: CustomSliderWidths(
                                    progressBarWidth: 10
                                ),
                                  customColors: CustomSliderColors(
                                    dotColor: Colors.yellow,
                                    progressBarColor: Colors.yellow,
                                    trackColor: HexColor('#6F223675'),

                                  ),

                                ),

                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 75,
                                  top: 60
                              ),
                              child: IconButton(
                                  iconSize:45 ,
                                  onPressed: (){

                                  }, icon:Image(
                                image: AssetImage('images/Picture15.png'),


                              )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
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
                                  left: 30,
                                  top: 135
                              ),
                              child: IconButton(
                                  iconSize:60 ,
                                  onPressed: (){

                                  }, icon:Image(
                                image: AssetImage('images/Picture16.png'),


                              )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50,
                                  top: 200
                              ),
                              child: IconButton(
                                  iconSize:75 ,
                                  onPressed: (){

                                  }, icon:Image(
                                image: AssetImage('images/Picture17.png'),


                              )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 135,
                                  top: 220
                              ),
                              child: IconButton(
                                  iconSize:60 ,
                                  onPressed: (){

                                  }, icon:Image(
                                image: AssetImage('images/Picture16.png'),


                              )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 210,
                                  top: 200
                              ),
                              child: IconButton(
                                  iconSize:75 ,
                                  onPressed: (){

                                  }, icon:Image(
                                image: AssetImage('images/Picture17.png'),
                              )
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  //  Fixed Container in Bottom of Screen
                ],
              ),
            ),
            floatingActionButton: Container(
              height: 300,padding:
            EdgeInsets.only(
                left: 300
            ),
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: (){},
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
            bottomSheet: buildBottomSheet(),
          ),
        );
      },
    );
  }
}
