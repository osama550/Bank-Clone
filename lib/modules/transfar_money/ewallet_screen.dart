import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/components.dart';
import 'package:project/components/in_out_components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/transfar_money/transfar_money_screen.dart';

class EWalletScreen extends StatelessWidget {
  EWalletScreen({Key? key}) : super(key: key);

  bool back = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Divider(
                color: Colors.grey.shade200,
                thickness: 2,
              ),
            ),
            Expanded(
              child: cubit.searchUser.isNotEmpty
                  ? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildFavoriteItem(
                        context: context,
                        onPressed: () async{
                          back = await navigateTo(context, transfarScreen());
                        },
                        image: cubit.transferWalletUsers[index]['Client_Photo'].toString(),
                        name: cubit.transferWalletUsers[index]['Transfer_To'],
                        type: cubit.transferWalletUsers[index]['Type'],
                        accountNumber: cubit.transferWalletUsers[index]['id'],
                        favoriteIcon: cubit.transferWalletUsers[index]['Favourit'] ? Icons.star_rate_rounded : Icons.star_border_rounded,
                        favoriteIconPressed: () {
                          print(
                              'Index Which CLicked Here ============> ${index}');
                          cubit.changeFavoriteIcon(
                            isFavorite: cubit.transferWalletUsers[index]['Favourit'],
                            type: cubit.transferWalletUsers[index]['Type'],
                            id: cubit.transferWalletUsers[index]['id'],
                            favorite_state: cubit.transferWalletUsers[index]['Favourit'].toString(),
                          );
                        },
                      ),
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                        ),
                        child: Divider(
                          color: Colors.grey.shade200,
                          thickness: 1,
                        ),
                      ),
                      itemCount: cubit.transferWalletUsers.length,
                    )
                  : const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        );
      },
    );
  }
}
