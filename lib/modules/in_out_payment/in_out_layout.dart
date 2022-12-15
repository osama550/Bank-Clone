import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/components/in_out_components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/in_out_payment/requested.dart';
import 'package:project/modules/in_out_payment/scheduled.dart';

class InOutLayoutScreen extends StatelessWidget {
  InOutLayoutScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                buildAppBar(
                  context: context,
                  screenTitle: 'In & Out Payment',
                ),
                const SizedBox(
                  height: 25.0,
                ),
                defaultTextFormFaild(
                  controller: searchController,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 50.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: cubit.inOutScreens[cubit.numberOfInOutScreen],
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     // ListView Item
                    //     // Expanded(
                    //     //   child: ListView.separated(
                    //     //     physics: const BouncingScrollPhysics(),
                    //     //     itemBuilder: (context, index) => buildHistoryItem(
                    //     //       context: context,
                    //     //       image: 'images/${index+1}.jpg',
                    //     //       name: 'Anime World',
                    //     //       date: 'Dec 24,2024',
                    //     //       time: '12.30 PM',
                    //     //       price: '\$25',
                    //     //     ),
                    //     //     separatorBuilder: (context, index) => const SizedBox(
                    //     //       height: 10.0,
                    //     //     ),
                    //     //     itemCount: 10,
                    //     //   ),
                    //     // ),
                    //     // cubit.inOutScreens[cubit.numberOfInOutScreen],
                    //   ],
                    // ),
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
