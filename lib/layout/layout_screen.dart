import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // if(AppCubit.get(context).layoutModel == null) {
        //   showDialog(
        //     context: context,
        //     builder:(BuildContext context){
        //       context=context;
        //       return  defaultLoading();
        //     },
        //   );
        // }
        // if(state is GetLayoutLoadingState){
        //   print('Yeeeeeeeeeeeeeeeeeeeeeeeeeees');
        // }
      },
    builder: (context, state) {
      var cubit = AppCubit.get(context);
      if(cubit.speaker){
        Timer(
          const Duration(seconds: 1),
              (){
                cubit.speak(text: 'الرجاء إختيار نوع الحساب');
              },
        );
      }
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: primaryColor,
        ),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Image.asset('images/home.jpeg'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 20.0,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                // child: Icon(
                                //   Icons.person,
                                //   color: Colors.white,
                                //   size: 45.0,
                                // ),
                                radius: 30.0,
                                // backgroundColor: Colors.grey.shade400,
                                // backgroundImage: Image.network('https://atmvoice.000webhostapp.com//photos//1.jpg');
                                backgroundImage: NetworkImage(cubit.layoutModel!.clientPhoto.toString()),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Welcome',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    '${cubit.layoutModel!.clientName}',
                                    style: TextStyle(
                                      color: layoutNameColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20.0),
                            color: Colors.black.withOpacity(0.15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20.0,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 10.0,
                            ),
                            child: Text(
                              'Available Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          width: 88.w,
                          height: 300.0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20.0,),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.28),
                                offset: const Offset(3,3),
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Stack(
                              children: [
                                SfCircularChart(
                                  series: <CircularSeries>[
                                    DoughnutSeries<AccountTypes, String>(
                                      radius: '60%',
                                      opacity: 0.7,
                                      onPointTap: (pointInteractionDetails){
                                        // print(pointInteractionDetails.pointIndex);
                                        // AppCubit.get(context).getLayoutData();
                                        // cubit.userAccount(index:pointInteractionDetails.pointIndex!);
                                        cubit.userAccountIndex = pointInteractionDetails.pointIndex!;
                                        if(pointInteractionDetails.pointIndex! == 1){
                                          cubit.getAllTransferUsers();
                                        }
                                        navigateTo(context, HomeScreen());
                                        },
                                      dataSource:[
                                        AccountTypes(cubit.layoutModel!.clientAccounts[0].accountType!, int.parse(cubit.layoutModel!.clientAccounts[0].accountBalance!), const Color.fromRGBO(215, 80, 20, 1)),
                                        AccountTypes(cubit.layoutModel!.clientAccounts[1].accountType!, int.parse(cubit.layoutModel!.clientAccounts[1].accountBalance!), const Color.fromRGBO(216, 110, 20, 1)),
                                        AccountTypes(cubit.layoutModel!.clientAccounts[2].accountType!, int.parse(cubit.layoutModel!.clientAccounts[2].accountBalance!), const Color.fromRGBO(216, 140, 20, 1)),
                                        AccountTypes(cubit.layoutModel!.clientAccounts[3].accountType!, int.parse(cubit.layoutModel!.clientAccounts[3].accountBalance!), const Color.fromRGBO(216, 160, 20, 1)),
                                      ],
                                      xValueMapper: (AccountTypes data, _) => data.type,
                                      yValueMapper: (AccountTypes data, _) => data.salary,
                                      pointColorMapper: (AccountTypes data, _) => data.color,
                                      dataLabelMapper: (AccountTypes data, _) => '\$${data.salary}\n${data.type}',
                                      enableTooltip: true,
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        labelPosition: ChartDataLabelPosition.outside,
                                        color: Colors.black26.withOpacity(0.25),
                                        borderRadius: 8.0,
                                        opacity: 0.1,
                                        textStyle: const TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      explode: true,
                                      // Explode all the segments
                                      explodeAll: true,
                                    )
                                  ],
                                  enableMultiSelection: true,
                                ),
                                Center(
                                  child: Text(
                                    '\$${cubit.layoutModel!.totalBalance}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  },
);
  }
}



class AccountTypes {
  AccountTypes(this.type,this.salary,this.color);
  final String type;
  final int salary;
  final Color color;
}