import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatelessWidget {
  Color button = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            defaultBackgroundImage(),
            defaultBankImage(),
            Container(
              padding: const EdgeInsets.only(
                left: 100,
                top: 150,
              ),
              child: Column(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: HexColor('#6F2236'),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 8),
                            blurRadius: 7.0,
                            color: Colors.grey,
                          ),
                        ]),
                  ),
                  Text(
                    'back !',
                    style: TextStyle(
                        color: HexColor('#6F2236'),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 8),
                            blurRadius: 7.0,
                            color: Colors.grey,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 35,
                top: 275,
              ),
              child: Column(
                children: const [
                  Text(
                    'Choose your favourite language',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 370,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45.0,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(
                            30.0,
                          ),
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 8),
                              blurRadius: 7.0,
                              color: Colors.grey,
                            )
                          ],
                          border: Border.all(
                            color: primaryColor,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'عربي',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: 40.0,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(
                        30.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 7.0,
                          color: Colors.grey,
                        )
                      ],
                      color: primaryColor,
                      border: Border.all(
                        color: primaryColor,
                        width: 2.5,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Text(
                        'English',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: buildBottomSheet(),
      ),
    );
  }
}
