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
        body: Column(
          children: [
            Expanded(
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
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 2.w,
                      bottom: 2.w,
                    ),

                    child: Container(
                      height: 50,
                      child: TextFormField(

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: HexColor('#c8abb3'),

              child: Expanded(
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
                          child: Text('9',
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
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor('#9E6F2236'),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Text(
                                'x',
                                style: TextStyle(
                                  color: HexColor('#6F2236'),
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                          ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
