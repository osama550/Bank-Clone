import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:sizer/sizer.dart';

class ChoosingBill extends StatelessWidget {
  const ChoosingBill({Key? key}) : super(key: key);

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
                        vertical: 5.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bill',
                            style: TextStyle(
                              fontSize: 27.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              buildBillType(
                                context: context,
                                index: 0,
                                image: cubit.bills[0]['image'],
                                title: cubit.bills[0]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 1,
                                image: cubit.bills[1]['image'],
                                title: cubit.bills[1]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 2,
                                image: cubit.bills[2]['image'],
                                title: cubit.bills[2]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 3,
                                image: cubit.bills[3]['image'],
                                title: cubit.bills[3]['title'],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            children: [
                              buildBillType(
                                context: context,
                                index: 4,
                                image: cubit.bills[4]['image'],
                                title: cubit.bills[4]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 5,
                                image: cubit.bills[5]['image'],
                                title: cubit.bills[5]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 6,
                                image: cubit.bills[6]['image'],
                                title: cubit.bills[6]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 7,
                                image: cubit.bills[7]['image'],
                                title: cubit.bills[7]['title'],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            children: [
                              buildBillType(
                                context: context,
                                index: 8,
                                image: cubit.bills[8]['image'],
                                title: cubit.bills[8]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 9,
                                image: cubit.bills[9]['image'],
                                title: cubit.bills[9]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 10,
                                image: cubit.bills[10]['image'],
                                title: cubit.bills[10]['title'],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              buildBillType(
                                context: context,
                                index: 11,
                                image: cubit.bills[11]['image'],
                                title: cubit.bills[11]['title'],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  Fixed Container in Bottom of Screen
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: (){},
              child: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
            bottomSheet: buildBottomSheet(),
          ),
        );
      },
    );
  }
}
