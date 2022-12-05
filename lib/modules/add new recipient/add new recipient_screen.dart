import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/modules/payment/electricity_screen.dart';
import 'package:project/modules/transfar_money/transfar_money_screen.dart';
import 'package:sizer/sizer.dart';


class AddNewRecipientScreen extends StatelessWidget {

  late String valueChoose;
  List listItem = [
    'bank',
    'Atm',
    'osama',
    'islam',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    buildAppBar(
                      context: context,
                      screenTitle: 'Transfer Money',
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          'Select Type',
                          style: TextStyle(fontSize: 15.sp),
                        )),
                    
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 25,
                        end: 25,
                        top: 10,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: EdgeInsetsDirectional.only(
                          top: 3,
                          bottom: 10,
                          start: 20,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            // color: primaryColor.withOpacity(0.5),
                            color: HexColor('#f4f4f4'),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: HexColor('#f4f4f4'), //////////////////////
                        ),
                        child: DropDownTextField(
                          textFieldDecoration:InputDecoration(
                            border: InputBorder.none,
                          ) ,
                          dropDownList: const [
                            DropDownValueModel(name: 'bank', value: 'Bank'),
                            DropDownValueModel(name: 'atm', value: 'ATM'),
                            DropDownValueModel(name: 'osama', value: 'Osama'),
                            DropDownValueModel(name: 'islam', value: 'Islam'),
                          ],
                          isEnabled: true,
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          dropDownItemCount: 4,

                        ),
                      ),
                    ),

                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          'Account Number/ Address',
                          style: TextStyle(fontSize: 15.sp),
                        )),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 25,
                        end: 25,
                        top: 10,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: EdgeInsetsDirectional.only(
                          top: 17,
                          bottom: 10,
                          start: 20,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            // color: primaryColor.withOpacity(0.5),
                            color: HexColor('#f4f4f4'),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: HexColor('#f4f4f4'), //////////////////////
                        ),
                        child: Text(
                          '659745',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(30.0),
                          color: primaryColor,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                title: Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(40),
                                              child: CircleAvatar(
                                                radius: 60,
                                                backgroundColor: primaryColor,
                                              ),
                                            ),
                                            Image.asset('images/icon6.png'),
                                          ],
                                        ),
                                      ),
                                      Text('Bill Paid Successfully!',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ),
                                content: Padding(
                                  padding: EdgeInsets.only(left: 27),
                                  child: Text(
                                    'Thank you for paying the bill',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                actions: [
                                  Container(
                                    width: 120,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primaryColor,
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Close',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: Colors.white,
                                          )),
                                    ),
                                  )
                                ],
                                actionsPadding: const EdgeInsets.only(
                                  right: 75,
                                  bottom: 20,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
            defaultNumbers(
              context: context,
              onPressed: (){
                navigateTo(context, transfarScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
