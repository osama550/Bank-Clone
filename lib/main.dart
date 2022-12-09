import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:project/bloc_observer.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/modules/Confirm%20Payment/Confirm%20Payment_Screen.dart';
import 'package:project/modules/add%20new%20recipient/add%20new%20recipient_screen.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/in_out_payment/history.dart';
import 'package:project/modules/payment/electricity_bill.dart';
import 'package:project/modules/transfar_money/favorite_screen.dart';
import 'package:project/modules/transfar_money/transfar_money_screen.dart';
import 'package:sizer/sizer.dart';

import 'modules/payment/electricity_screen.dart';


//
void main() {
  disabledCapture();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  //  to change status bar and icon color
//SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//         statusBarColor: Colors.white,
//         statusBarIconBrightness: Brightness.dark
//     ),
//   );

  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();

}
disabledCapture(){
  FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            home: FavoriteScreen() ,
          );
        },
      ),
    );
  }
}

