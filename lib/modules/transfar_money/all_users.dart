import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/in_out_components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';

class AllUsersScreen extends StatelessWidget {
   const AllUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state){
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
                itemBuilder: (context, index) =>buildFavoriteItem(
                  context: context,
                  image: cubit.transferUsers[index]['Client_Photo'].toString(),
                  name: cubit.transferUsers[index]['Transfer_To'],
                  type: cubit.transferUsers[index]['Type'],
                  accountNumber: cubit.transferUsers[index]['id'],
                  favoriteIcon: cubit.transferUsers[index]['Favourit'] ? Icons.star_rate_rounded : Icons.star_border_rounded,
                  favoriteIconPressed: () {
                    print('Index Which CLicked Here ============> ${index}');
                    cubit.changeFavoriteIcon(
                      isFavorite: cubit.transferUsers[index]['Favourit'],
                      type: cubit.transferUsers[index]['Type'],
                      id: cubit.transferUsers[index]['id'],
                      favorite_state: cubit.transferUsers[index]['Favourit'].toString(),
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
                itemCount: cubit.transferUsers.length,
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