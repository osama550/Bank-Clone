import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/components/in_out_components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';


class LayoutInOutScreen extends StatelessWidget {
  LayoutInOutScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  child: Container(
                    height: 40.0,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.only(
                          bottom: 5.0,
                        ),
                        filled: true,
                        fillColor: HexColor('#D9D9D9').withOpacity(0.5,),
                        prefixIcon: Icon(
                          Icons.search,
                          color: HexColor('#292D32').withOpacity(0.8),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
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
                            // Expanded(
                            //   child: Container(
                            //     height: 45.0,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadiusDirectional.circular(30.0,),
                            //       color: primaryColor,
                            //         border: Border.all(
                            //           color: primaryColor,
                            //           width: 2.5,
                            //         ),
                            //     ),
                            //     child: MaterialButton(
                            //       onPressed: (){},
                            //       child: Text(
                            //         'History',
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.w400,
                            //           fontSize: 15.sp,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            inOutButton(
                              onPressed: (){},
                              text: 'History',
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            inOutButton(
                              onPressed: (){},
                              text: 'Scheduled',
                              textColor: primaryColor,
                              background: Colors.white,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            inOutButton(
                              onPressed: (){},
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
                              image: 'images/${index+1}.jpg',
                              name: 'Anime World',
                              date: 'Dec 24, 2024',
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
