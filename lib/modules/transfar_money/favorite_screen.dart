import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/components/in_out_components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

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
                buildAppBar(
                  context: context,
                  screenTitle: 'Transfer Money',
                ),
                const SizedBox(
                  height: 25.0,
                ),
                defaultTextFormFaild(
                  controller: searchController,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0
                  ),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: Text(
                          'All',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildFavoriteItem(
                          context: context,
                          image: 'images/${index + 1}.jpg',
                          name: 'Anime World',
                          type: 'Bank',
                          accountNumber: '47896021',
                          favoriteIcon: cubit.favoriteIcon,
                          favoriteIconPressed: (){
                            cubit.changeFavoriteIcon();
                          },
                          color: cubit.favoriteColor,
                        ),
                    separatorBuilder: (context, index) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                          ),
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                          ),
                        ),
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 70.0,
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            bottomSheet: buildBottomSheet(),
          ),
        );
      },
    );
  }
}

