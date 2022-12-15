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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
        );
      },
    );
  }
}
