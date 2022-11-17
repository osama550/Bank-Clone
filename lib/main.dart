import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc_observer.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  //  to change status bar and icon color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ),
  );
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
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
            home: HomeScreen() ,
          );
        },
      ),
    );
  }
}

