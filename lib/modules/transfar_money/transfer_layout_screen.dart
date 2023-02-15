import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/components/in_out_components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/modules/add%20new%20recipient/add%20new%20recipient_screen.dart';
import 'package:sizer/sizer.dart';

class TransferLayoutScreen extends StatelessWidget {
  TransferLayoutScreen({Key? key}) : super(key: key);
  final item = [];
  void addItem() {}

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // AppCubit.get(context).searchuser();
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        // cubit.searchuser();
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
                  title: buildTransferAppBar(
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
                        onChanged: (value) => cubit.runFilter(value),
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
                            fillColor: HexColor('#D9D9D9').withOpacity(
                              0.5,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: HexColor('#292D32').withOpacity(0.8),
                              size: 30.0,
                            ),
                            suffixIcon: IconButton(
                                onPressed:scanQr,
                                icon: Image(
                                  image: AssetImage(
                                    'images/qr.png',
                                  ),
                                  height: 20,
                                  width: 20,
                                ))),
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        text: 'Favorite',
                      ),
                      Tab(
                        text: 'Bank',
                      ),
                      Tab(
                        text: 'E-wallet',
                      )
                    ],
                    onTap: (int index) {
                      cubit.changeTabBarIndex(index);
                      print(cubit.tabIndex);
                    },
                    padding: EdgeInsets.only(right: 30, left: 30),
                    labelColor: primaryColor,
                    unselectedLabelColor: Colors.black,
                    labelPadding: EdgeInsets.only(left: 3),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
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
              body: cubit.transferScreens[cubit.tabIndex],
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  navigateTo(context, AddNewRecipientScreen());
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
  Future<void> scanQr({context}) async {
    try {
      FlutterBarcodeScanner.scanBarcode(
          '#2A99CF',
          'cancel',
          true,
          ScanMode.QR)
          .then((value) {
        AppCubit.get(context).SaveQr(value);

      });
    } catch (e) {
      AppCubit.get(context).ErrorQr();
    }
  }

}
