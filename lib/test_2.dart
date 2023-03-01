import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';

class Test2 extends StatelessWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    cubit.speak(text: 'Welcome islam');
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
                'Test 2'
            ),
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
                cubit.speak(text: 'اهلاً بك فى هيكس بانك'
                    '\n \n الرجاء إدخال البصما');
                Timer(
                  const Duration(seconds: 4),
                    (){
                    cubit.listen(userSpeak: true,);
                    },
                );

              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
