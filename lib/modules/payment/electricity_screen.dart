import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/components.dart';
import 'package:sizer/sizer.dart';

class ServiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
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
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 2.w,
                      bottom: 2.w,
                    ),

                    child: Container(
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value){
                          print(value);
                        },

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: HexColor('#c8abb3'),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('2',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('3',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('4',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('5',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('6',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('7',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('8',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_back,size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ////////////////////////////////////

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Container(
                                       decoration: BoxDecoration(
                                        color: HexColor('#9E6F2236'),
                                        borderRadius: BorderRadiusDirectional.circular(15.0),
                                       ),
                                       clipBehavior: Clip.antiAliasWithSaveLayer,
                                       child:  Padding(
                                         padding: EdgeInsets.symmetric(
                                           horizontal: 20.0,
                                           vertical: 12.0,
                                         ),
                                         child: Text(
                                           'X',
                                           style: TextStyle(
                                             color: HexColor('#6F2236'),
                                             fontWeight: FontWeight.w400,
                                             fontSize: 20.0,)))),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor('#6F2236'),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: HexColor('#9E6F2236'),
//                               ),
//                               child: IconButton(
//                                 onPressed: () {},
//                                 icon: Text(
//                                   'x',
//                                   style: TextStyle(
//                                     color: HexColor('#6F2236'),
//                                     fontSize: 20.sp,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),