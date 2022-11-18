import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:sizer/sizer.dart';

class ServiseScreen extends StatelessWidget {
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
                  children: [
                    paymentBill(
                        context: context,
                        screenTitle: ('Electricity'),
                        imagePath: 'images/Picture2.png',
                        imageHeader: 'Pay Electricity Bill',
                        payType: ('Electricity')),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: EdgeInsets.only(left: 7.w),
                      child: Text(
                        'Bank Account',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 25,
                        end: 25,
                        top: 5,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.only(
                          top: 7,
                          bottom: 10,
                          start: 13,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            // color: primaryColor.withOpacity(0.5),
                            color: primaryColor.withOpacity(
                              0.5,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          '1234',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            defaultNumbers(),
          ],
        ),
      ),
    );
  }
}

Widget defaultNumbers() => Container(
      //width: 250.w,
      //height: 100.w,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primaryColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('1',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('3',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('4',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('5',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('6',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('7',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('8',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('9',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  color: HexColor('#925766'),
                  height: 50,
                  width: 60,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('0',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 50,
                  width: 60,
                  color: HexColor('#925766'),
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.backspace_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ////////////////////////////////////

          //Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                     decoration: BoxDecoration(
          //                       color: HexColor('#9E6F2236'),
          //                       borderRadius: BorderRadiusDirectional.circular(15.0),
          //                     ),
          //                     clipBehavior: Clip.antiAliasWithSaveLayer,
          //                     child:  Padding(
          //                         padding: EdgeInsets.symmetric(
          //                           horizontal: 20.0,
          //                           vertical: 12.0,
          //                         ),
          //                         child: Text(
          //                             'X',
          //                             style: TextStyle(
          //                               color: HexColor('#6F2236'),
          //                               fontWeight: FontWeight.bold,
          //                               fontSize: 20.sp,)))),
          //                 SizedBox(
          //                   width: 5.w,
          //                 ),
          //                 Container(
          //                   padding: EdgeInsets.only(
          //                     left: 30,
          //                     right: 30,
          //                   ),
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(20),
          //                     color: HexColor('#6F2236'),
          //                   ),
          //                   child: TextButton(
          //                     onPressed: () {},
          //                     child: Text(
          //                       'Continue',
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 18.sp,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
        ],
      ),
    );
