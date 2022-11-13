
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/modules/payment/bill_services.dart';
import 'package:sizer/sizer.dart';
import 'colors/colors.dart';
import 'package:cool_alert/cool_alert.dart';

void navigateTo(context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

void navigateAndFinish(context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false,
  );

}

// ---------------------------------------

Widget buildAppBar({
  required BuildContext context,
  required String screenTitle,
}) => Row(
  children: [
    IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: primaryColor,
      ),
    ),
    const SizedBox(
      width: 5.0,
    ),
    Text(
      screenTitle,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
      ),
    ),
    const Spacer(),
    Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
      ),
      child: Image.asset(
        'images/Picture14.png',
        width: 18.w,
        height: 7.h,
        fit: BoxFit.fill,
      ),
    ),
  ],
);

//-----------------------------------------


Widget paymentBill({
  required BuildContext context,
  required String screenTitle,
  required String imagePath,
  required String imageHeader,
  required String payType,

}) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const SizedBox(
      height: 10.0,
    ),
    Row(
      children: [
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: primaryColor,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          screenTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            right: 10.0,
          ),
          child: Image.asset(
            'images/Picture14.png',
            width: 18.w,
            height: 7.h,
            fit: BoxFit.fill,
          ),
        ),
      ],
    ),
    const SizedBox(
      height: 20.0,
    ),
    Image.asset(
      imagePath,
      width: 20.w,
      height: 10.h,
      fit: BoxFit.fill,
    ),
    const SizedBox(
      height: 8.0,
    ),
    Text(
      imageHeader,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
    ),
    const SizedBox(
      height: 5.0,
    ),
    Text(
      '''pay ${payType} bill safely , conveniently & easily .
         you can pay anytime and anywhere!''',
      style: TextStyle(
          fontSize: 10.sp
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Divider(
        color: Colors.grey.shade100,
        thickness: 1.8,
      ),
    ),
  ],
);

//----------------------------------------------------

Widget paymentData({
  required String title,
  required String answer,
}) => Row(
  children: [
    Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
      ),
    ),
    // const Spacer(),
    const SizedBox(
      width: 15.0,
    ),
    Expanded(
      child: Text(
        answer,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
  ],
);

//----------------------------------------------------

Widget paymentButton({
  required BuildContext context,
  String text = 'Confirm Payment',
  HexColor? color,
}) => Padding(
  padding: EdgeInsets.symmetric(
    horizontal: 8.w,
  ),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(30.0),
      color: color?? primaryColor,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: MaterialButton(
      onPressed: (){
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          backgroundColor: HexColor('#6F2236'),
          title: 'Successfully!',

          text: 'Thank you for paying the bill',
          loopAnimation: false,
          //autoCloseDuration:Duration(seconds: 2),
          confirmBtnText:'Ok',
          confirmBtnTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
        // CoolAlert.show(
        //   context: context,
        //   type: CoolAlertType.error,
        //   backgroundColor: HexColor('#6F2236'),
        //   title: 'Error',
        //
        //   text: 'Sorry, something went wrong',
        //   loopAnimation: false,
        //   //autoCloseDuration:Duration(seconds: 2),
        //   confirmBtnText:'Close',
        //   confirmBtnTextStyle: TextStyle(
        //     color: Colors.white,
        //     fontSize: 15.sp,

          ),

          confirmBtnColor: HexColor('#6F2236'),



        );



      },
      child: Text(
        'Confirm Payment',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  ),
);

//----------------------------------------------------

Widget bill({
  required String price,
  required String name,
  required String bankAccount,
}) => Padding(
  padding: EdgeInsets.symmetric(
      horizontal: 6.w,
      vertical: 5.h
  ),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadiusDirectional.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 6,
          offset: const Offset(4, 5), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: HexColor('#DCDDE1'),
              radius: 40.0,
              child: const Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 65.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 1,
          ),
          const SizedBox(
            height: 20.0,
          ),
          paymentData(
            title: 'Bill(USD)',
            answer: price,
          ),
          const SizedBox(
            height: 20.0,
          ),
          paymentData(
            title: 'Name',
            answer: name,
          ),
          const SizedBox(
            height: 20.0,
          ),
          paymentData(
            title: 'Bank Account',
            answer: bankAccount,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                'Status',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadiusDirectional.circular(10.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  child: Text(
                    'unpaid',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
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

//------------------------------------------------------------

Widget defaultIconButton({
  required BuildContext context,
  Color? color,
  IconData icon = Icons.arrow_back_ios_rounded,
  VoidCallback? onPressed,
})=> IconButton(
  onPressed: onPressed,
  icon: Icon(
    icon,
    color: color ?? primaryColor,
  ),
);

//------------------------------------------------------------
Widget buildBillType({
  required BuildContext context,
  required int index,
  required String image,
  required String title,
  // required VoidCallback onpPressed,
}) =>Expanded(
  child: InkWell(
    onTap: (){
      AppCubit.get(context).selectBillScreen(index);
      navigateTo(context, ServiseScreen());
    },
    child: Container(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 8.h,
            // fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.0.sp,
            ),
          ),
        ],
      ),
    ),
  ),
);

//------------------------------------------------------------

Widget buildLogo({
  required BuildContext context,
})=> Stack(
  alignment: AlignmentDirectional.topEnd,
  children: [
    Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          height: 20.0.h,
          width: double.infinity,
          child: Image.asset(
            'images/Picture20.png',
            fit: BoxFit.fill,
          ),
        ),
        defaultIconButton(
          context: context,
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ],
    ),
    defaultIconButton(
        context: context,
        color: Colors.white,
        icon: Icons.menu_rounded,
      onPressed: (){},
    ),
  ],
);

Widget buildBottomSheet() => Container(
  height: 50.0,
  width: double.infinity,
  decoration: BoxDecoration(
    color: primaryColor,
    borderRadius: const BorderRadiusDirectional.only(
      topStart: Radius.circular(12.0),
      topEnd: Radius.circular(12.0),
    ),
  ),
  clipBehavior: Clip.antiAliasWithSaveLayer,
);
