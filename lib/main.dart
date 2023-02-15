import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc_observer.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/in_out_payment/in_out_layout.dart';
import 'package:project/modules/login_screen/login_screen.dart';
import 'package:project/modules/payment/select_electricity.dart';
import 'package:project/modules/qr/qr_screen.dart';
import 'package:project/modules/spalsh_screen/splash_screen.dart';

import 'package:project/modules/transfar_money/transfar_money_screen.dart';
import 'package:project/modules/transfar_money/transfer_layout_screen.dart';
import 'package:project/network/local/cashe_helper.dart';
import 'package:project/network/remote/dio_helper.dart';
import 'package:sizer/sizer.dart';


//
void main() async{
  // disabledCapture();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  DioHelper.init();
  await CacheHelper.init();
  bool? speaker=CacheHelper.getBoolean(key: 'speaker');

  // bool? isSpeak = CacheHelper.getBoolean();


  //  to change status bar and icon color
//SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//         statusBarColor: Colors.white,
//         statusBarIconBrightness: Brightness.dark
//     ),
//   );

  runApp( MyApp(speaker!));
  Bloc.observer = MyBlocObserver();

}
// disabledCapture(){
//   FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
// }

class MyApp extends StatelessWidget {

  final bool speaker;
  MyApp(this.speaker);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..changeSpeak(isSpeaker:speaker ),
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            home: LoginScreen() ,
          );
        },
      ),
    );
  }
}

