import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/components/in_out_components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/add%20new%20recipient/add%20new%20recipient_screen.dart';
import 'package:sizer/sizer.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final item =[];
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  void addItem(){}

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(175.0),
                child: AppBar(
                  iconTheme: IconThemeData(
                    color: primaryColor, //change your color here
                  ),
                  backgroundColor: Colors.white,
                  title:buildTransferAppBar(
                    context: context,
                    screenTitle: 'Transfer Money',
                  ),
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(
                      right: 40.0,
                      left: 40.0,
                      top: 70.0,
                    ),
                    child: Container(
                      height: 45.0,
                      child: TextFormField(
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
                          suffixIcon:IconButton(
                              onPressed: (){

                              }, icon: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ))
                        ),
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'All',),
                      Tab(text: 'Favorite',),
                      Tab(text: 'Bank',),
                      Tab(text: 'E-wallet',)
                    ],
                    padding: EdgeInsets.only(

                        right: 30,
                        left: 30
                    ),
                    labelColor: primaryColor,
                    unselectedLabelColor: Colors.black,
                    labelPadding: EdgeInsets.only(
                        left: 3
                    ),

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                    indicator: UnderlineTabIndicator(
                      borderSide:BorderSide(
                        width: 5,
                        color: primaryColor,
                      ),
                      insets: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),

                    ),

                  ),
                  elevation: 0,


                ),
              ),
              body: Column(
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
                    child:ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>buildFavoriteItem(
                          context: context,
                          index: index-1,
                          image: 'images/${index + 1}.jpg',
                          name: 'Hex Team',
                          type: 'Bank',
                          accountNumber: '47896021',
                          favoriteIcon: cubit.favoriteIcon[index],
                          favoriteIconPressed: (){
                            print('Index Which CLicked Here ============> ${index}');
                            cubit.changeFavoriteIcon(index: index);
                          },
                          color: cubit.favoriteColor[index],
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
          itemCount:10 ,
        ),
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  navigateAndFinish(context, AddNewRecipientScreen());
                },
                backgroundColor: primaryColor,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              bottomSheet: buildBottomSheet(),
            ),
          ),
        );
      },
    );
  }
}


