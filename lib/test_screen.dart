import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/test_2.dart';
import 'dart:async';


class Test1 extends StatelessWidget {
   Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool userSpeak = true;
    var cubit = AppCubit.get(context);
    cubit.speak(text: 'اهلاً بك فى هيكس بانك'
        '\n \n الرجاء إدخال البصما');
    Timer(
      const Duration(seconds: 5),
          ()async{
          cubit.listen(userSpeak: userSpeak);
      },
    );
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
                'Test 1'
            ),
          ),
          body: Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  navigateTo(context, Test2());
                  userSpeak = false;
                  cubit.listen(userSpeak: false);
                  },
                child: const Text(
                  'Click Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
