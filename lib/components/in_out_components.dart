

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/modules/e_Receipt/e-receipt_screen.dart';
import 'package:project/modules/transfar_money/transfar_money_screen.dart';
import 'package:sizer/sizer.dart';

Widget inOutButton({
  required VoidCallback onPressed,
  required String text,
  Color? background,
  Color textColor = Colors.white,
}) => Expanded(
  child:   Container(
    height: 45.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(30.0,),
      color: background?? primaryColor,
      border: Border.all(
        color: primaryColor,
        width: 2.5,
      ),
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 11.sp,
        ),
      ),
    ),
  ),
);

// -------------------------------------------------------------

Widget buildHistoryItem({
  required BuildContext context,
  required String image,
  required String name,
  required String date,
  required String time,
  required String price,
}) => GestureDetector(
  onTap: (){
    navigateTo(context, EReceiptScreen());
  },
  child:Container(
    height: 80.0,
    margin: EdgeInsets.only(
      bottom: 10,
    ),
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

                      fontSize: 8.sp,

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

                      fontSize: 9.sp,

                    ),

                  ),

                ],
              ),],

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
              if(AppCubit.get(context).numberOfInOutScreen == 0)
                Row(

                children: [

                  const Icon(

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
              if(AppCubit.get(context).numberOfInOutScreen == 1)
                Container(

                decoration: BoxDecoration(

                  borderRadius: BorderRadiusDirectional.circular(6.0,),

                  color: Colors.blue.withOpacity(0.2,),

                ),

                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: const Padding(

                  padding: EdgeInsets.symmetric(

                    vertical: 5.0,

                    horizontal: 8.0,

                  ),

                  child: Text(

                    'Scheduled',

                    style: TextStyle(

                      color: Colors.blue,

                      fontWeight: FontWeight.w500,

                      fontSize: 12.0,

                    ),

                  ),

                ),

              ),
              if(AppCubit.get(context).numberOfInOutScreen == 2)
                Container(

                decoration: BoxDecoration(

                  borderRadius: BorderRadiusDirectional.circular(6.0,),

                  color: Colors.blue,

                ),

                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: const Padding(

                  padding: EdgeInsets.symmetric(

                    vertical: 5.0,

                    horizontal: 8.0,

                  ),

                  child: Text(

                    'Completed',

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.w500,

                      fontSize: 12.0,

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
);

// -------------------------------------------------------------


Widget defaultTextFormFaild({
  required TextEditingController controller,
}) => Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 40.0,
  ),
  child: Container(
    height: 40.0,
    child: TextFormField(
      controller: controller,
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
);



//----------------------------------------------------------------------

Widget buildInOutButtons({
  required BuildContext context,
}) => Row(
  children: [
    inOutButton(
      onPressed: () {
        AppCubit.get(context).selectInOutPayment(index: 0,);
      },
      text: 'History',
    ),
    const SizedBox(
      width: 5.0,
    ),
    inOutButton(
      onPressed: () {
        AppCubit.get(context).selectInOutPayment(index: 1,);
      },
      text: 'Scheduled',
      textColor: primaryColor,
      background: Colors.white,
    ),
    const SizedBox(
      width: 5.0,
    ),
    inOutButton(
      onPressed: () {
        AppCubit.get(context).selectInOutPayment(index: 2,);
      },
      text: 'Requested',
      textColor: primaryColor,
      background: Colors.white,
    ),
  ],
);

//----------------------------------------------------------------------


Widget buildFavoriteItem( {
  required BuildContext context,
  required String image,
  required String name,
  required String type,
  required String accountNumber,
  required IconData favoriteIcon,
  required VoidCallback favoriteIconPressed,
  required VoidCallback onPressed,

  // Color color = Colors.white,
  // Color iconColor = Colors.amber,
  // required int index,
}) => GestureDetector(
  onTap: onPressed,
  child: Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 13.0,
    ),
    child: Container(
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20.0,),
        color: Colors.white,
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
              backgroundImage: NetworkImage(image),
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
                      type,
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
                      accountNumber,
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
            IconButton(
              onPressed: favoriteIconPressed,
              icon: Icon(
                favoriteIcon,
                size: 30.0,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);

