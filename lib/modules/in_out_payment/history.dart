import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/components/in_out_components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/in_out_payment/requested.dart';
import 'package:project/modules/in_out_payment/scheduled.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 3 Buttons
                        Row(
                          children: [
                            inOutButton(
                              onPressed: () {
                                cubit.selectInOutPayment(index: 0,);
                              },
                              text: 'History',
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            inOutButton(
                              onPressed: () {
                                cubit.selectInOutPayment(index: 1,);
                                navigateTo(context, ScheduledScreen());
                              },
                              text: 'Scheduled',
                              textColor: primaryColor,
                              background: Colors.white,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            inOutButton(
                              onPressed: () {
                                cubit.selectInOutPayment(index: 2,);
                                navigateTo(context, RequestedScreen());
                              },
                              text: 'Requested',
                              textColor: primaryColor,
                              background: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // ListView Item
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildHistoryItem(
                              context: context,
                              image: 'images/${index+1}.jpg',
                              name: 'Anime World',
                              date: 'Dec 24,2024',
                              time: '12.30 PM',
                              price: '\$25',
                            ),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 10.0,
                            ),
                            itemCount: 10,
                          ),
                        ),
                      ],
                    ),
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
