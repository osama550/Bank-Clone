import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              defaultBackgroundImage(),
              defaultBankImage(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'login to',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'BANQUE MISR ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: 90.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.8),
                        borderRadius: BorderRadiusDirectional.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 15.0,
                            // offset: const Offset(5, 5),
                          ),
                        ],

                      ),

                    ),
                  ],

                ),
              ),
              Container(
                padding:EdgeInsets.only(
                  top:42.h
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap:(){
                        defaultShowButtomSheet(context: context,
                            icon: Icon(Icons.fingerprint_outlined,
                            size: 100
                            ),

                        );
                      },
                      child:
                        Container(
                          width: 25.w,
                          height: 25.h,
                          child: Image.asset(
                            'images/finger.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                    ),
                    GestureDetector(
                      onTap:(){
                        showModalBottomSheet(
                            backgroundColor: primaryColor.withOpacity(1.0),
                            context: context,
                            builder: (context){
                              return Container(
                                width: double.infinity,
                                height: 38.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.1),
                                      blurRadius: 50.0,
                                      spreadRadius: 50.0,
                                      // offset: const Offset(5, 5),
                                    ),
                                  ],


                                ),
                                child: Center(
                                  child: Image.asset(
                                    'images/Sound.png',
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 100,

                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child:
                      Container(
                        width: 25.w,
                        height: 25.h,
                        child: Image.asset(
                          'images/voice.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                    ),
                  ],
                ),
              ),


            ],
          ),
        bottomSheet: buildBottomSheet(),

      ),
    );
  }
}
