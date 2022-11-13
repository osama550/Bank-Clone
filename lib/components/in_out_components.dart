

import 'package:flutter/material.dart';
import 'package:project/components/colors/colors.dart';
import 'package:sizer/sizer.dart';

Widget inOutButton({
  required VoidCallback onPressed,
  required String text,
  Color? background,
  Color textColor = Colors.white,
}) => Container(
  height: 45.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(30.0,),
    color: background?? primaryColor,
    border: Border.all(
      color: primaryColor,
      width: 2.5,
    ),
  ),
  child: Expanded(
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
      ),
    ),
  ),
);

// -------------------------------------------------------------

Widget buildHistoryItem({
  required String image,
  required String name,
  required String date,
  required String time,
  required String price,
}) => Container(
  height: 80.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(20.0,),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(0, 5),
        blurStyle: BlurStyle.normal
        // changes position of shadow
      ),
    ],
  ),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.0.sp,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Container(
                  height: 8.0,
                  width: 1.0,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              price,
              style: TextStyle(
                color: Colors.red,
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.outbox,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 3.0,
                ),
                Text(
                  'Expense',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ),
);