import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class LoginScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    var cubit = AppCubit.get(context);
    if(cubit.speaker) {
      cubit.speak(text: 'اهلاً بك فى هيكس بانك'
          '\n \n الرجاء إدخال البصما');
      Timer(
        const Duration(seconds: 4),
            ()async{
          cubit.listen(userSpeak: true);
          Timer(
              const Duration(seconds: 5),
                  () async{
                if (cubit.text.contains('بصمه')) {
                  cubit.text = '';
                  await cubit.checkBiometrics().then((value){
                    print(cubit.canCheckBiometrics);
                    if(cubit.canCheckBiometrics!){
                      if(cubit.speaker){
                        cubit.speak(text: 'جاري إدخال البصما');
                      }
                      cubit.authenticate(context: context).then((value){
                        if(cubit.layoutModel == null){
                          if(cubit.isAuthenticating!){
                            if(cubit.speaker){
                              cubit.speak(text: 'تم تأكيد البصما بنجاح');
                            }
                            print('isAuthenticating =====> ${cubit.isAuthenticating}');
                            showDialog(
                              context: context,
                              builder:(BuildContext context){
                                context=context;
                                return  defaultLoading();
                              },
                            );
                          }
                          else{
                            if(cubit.speaker){
                              cubit.speak(text: '\n \n \n البصما غير صحيحا'
                                  '\n \n \n \nالرجاء إدخال البصما');
                              Timer(
                                const Duration(seconds: 4),
                                    () async{
                                  cubit.listen(userSpeak: true);
                                },
                              );
                            }
                          }
                        }
                        // else{
                        //   navigateAndFinish(context, LayoutScreen());
                        // }
                      }).catchError((onError){
                        print('Error When Authenticated =====> ${onError.toString()}');
                      });
                    }
                  });
                }
              }
          );
        },
      );

    }

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(AppCubit.get(context).layoutModel != null && cubit.authorized == 'Authorized'){
          navigateAndFinish(context, LayoutScreen());
        }
      },
      builder: (context, state) {
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            IconButton(
                              onPressed: (){
                                cubit.changeSpeak();
                                },
                              icon: cubit.speaker? const Icon(
                                Icons.volume_up,
                                size: 40.0,
                                color: Colors.black,
                              ) : const Icon(
                                Icons.volume_off,
                                size: 40.0,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'login to',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'BANQUE MISR ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
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
                  padding: EdgeInsets.only(
                      top: 42.h
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: ()async{
                          cubit.listen(userSpeak: false);
                          await cubit.checkBiometrics().then((value){
                            print(cubit.canCheckBiometrics);
                            if(cubit.canCheckBiometrics!){
                              if(cubit.speaker){
                                cubit.speak(text: 'جاري إدخال البصما');
                              }
                              cubit.authenticate(context: context).then((value){
                                if(cubit.layoutModel == null){
                                  if(cubit.isAuthenticating!){
                                    if(cubit.speaker){
                                      cubit.speak(text: 'تم تأكيد البصما بنجاح');
                                    }
                                    print('isAuthenticating =====> ${cubit.isAuthenticating}');
                                    showDialog(
                                      context: context,
                                      builder:(BuildContext context){
                                        context=context;
                                        return  defaultLoading();
                                      },
                                    );
                                  }
                                  else{
                                    if(cubit.speaker){
                                      cubit.speak(text: '\n \n \n البصما غير صحيحا'
                                          '\n \n \n \nالرجاء إدخال البصما');
                                      Timer(
                                        const Duration(seconds: 4),
                                          () async{
                                          cubit.listen(userSpeak: true);
                                          },
                                      );

                                    }
                                  }
                                }
                                // else{
                                //   navigateAndFinish(context, LayoutScreen());
                                // }
                              }).catchError((onError){
                                print('Error When Authenticated =====> ${onError.toString()}');
                              });
                            }
                          });
                          defaultShowButtomSheet(context: context,
                            icon: const Icon(
                                Icons.fingerprint_outlined,
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
                        onTap: (){
                          cubit.getLayoutData();
                          navigateAndFinish(context, LayoutScreen());
                          showModalBottomSheet(
                              backgroundColor: primaryColor.withOpacity(1.0),
                              context: context,
                              builder: (context) {
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
      },
    );
  }
}
