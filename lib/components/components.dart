import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/colors/colors.dart';
import 'package:project/cubit/app_cubit.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/payment/electricity_screen.dart';
import 'package:sizer/sizer.dart';

void navigateTo(context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

// void navigateReplacement(context, Widget screen) {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (context) => screen),
//   );
// }

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
  int id = 0,
}) =>
    Row(
      children: [
        IconButton(
          onPressed: () {
            AppCubit.get(context).clearAmount(
              id: id,
            );
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
            color: Colors.black
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

Widget buildTransferAppBar({
  required BuildContext context,
  required String screenTitle,
}) =>
    Column(
      children: [
        Row(
          children: [
            // IconButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   icon: Icon(
            //     Icons.arrow_back_ios_rounded,
            //     color: primaryColor,
            //   ),
            // ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              screenTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.black
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

        // Container(
        //   child: TextFormField(
        //     decoration: InputDecoration(
        //       enabledBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(20.0),
        //         borderSide: BorderSide.none,
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(20.0),
        //         borderSide: BorderSide.none,
        //       ),
        //       contentPadding: const EdgeInsets.only(
        //         bottom: 5.0,
        //       ),
        //       filled: true,
        //       fillColor: HexColor('#D9D9D9').withOpacity(0.5,),
        //       prefixIcon: Icon(
        //         Icons.search,
        //         color: HexColor('#292D32').withOpacity(0.8),
        //         size: 30.0,
        //       ),
        //     ),
        //   ),
        // ),

      ],
    );

//-----------------------------------------

Widget paymentBill({
  required BuildContext context,
  required String screenTitle,
  required String imagePath,
  required String imageHeader,
  required String payType,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                AppCubit.get(context).clearAmount(
                  id: 1,
                );
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
          style: TextStyle(fontSize: 10.sp),
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
}) =>
    Row(
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
  required VoidCallback onPressed,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(30.0),
          color: color ?? primaryColor,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
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

AlertDialog defaultSuccessDialog(context)=>AlertDialog(
  backgroundColor:Colors.white,
  title:Center(
    child:Column(
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
            style:TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            )
        ),
      ],
    ),
  ),
  content:  const Padding(
    padding: EdgeInsets.only(
      left: 27,
      bottom: 20.0,
    ),
    child: Text(
      'Thank you for paying the bill',style: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    ),
  ),
  actions: [
    Container(
      width: 120,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),color:primaryColor,
      ),
      child:MaterialButton(
        onPressed: () {
          navigateAndFinish(context, HomeScreen());
        },
        child: const Text(
            'Close',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.white,
            )
        ),
      ) ,
    )
  ],
  actionsPadding: const EdgeInsets.only(
    right: 75,
    bottom: 20,
  ),
);
AlertDialog defaultErrorDialog({
  required BuildContext context,
  required String errorText,
})=>AlertDialog(
  backgroundColor:primaryColor,
  title:Center(
    child:Column(
      children: [
        Image.asset('images/icon7.png'),
        Text('Error !',
            style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
        ),
      ],
    ),
  ),
  content: Padding(
    padding: const EdgeInsets.only(
      left: 10,
      bottom: 20.0,
    ),
    child: Text(
      errorText,
      style: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    ),
  ),
  actions: [
    Container(
      width: 120,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),color:Colors.white,
      ),
      child:MaterialButton(
        onPressed: () {
          navigateAndFinish(context, HomeScreen());
        },
        child: const Text(
            'Close',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.black,
            )
        ),
      ) ,
    )
  ],
  actionsPadding: const EdgeInsets.only(
    right: 75,
    bottom: 20,
  ),
);

//----------------------------------------------------

Widget bill({
  required String price,
  required String name,
  required String bankAccount,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
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
}) =>
    IconButton(
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
}) =>
    Expanded(
      child: InkWell(
        onTap: () {
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
                  fontSize: 10.0.sp,
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
}) => Stack(
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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        defaultIconButton(
          context: context,
          color: Colors.white,
          icon: Icons.menu_rounded,
          onPressed: () {},
        ),
      ],
    );

//------------------------------------------------------------

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

//------------------------------------------------------------

Widget defaultNumbers({
  required BuildContext context,
  required VoidCallback onPressed,
  required String amount,
  required int id,
}) => Container(
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(15),
      topLeft: Radius.circular(15),
    ),
    color: primaryColor,
  ),
  child: Column(
    children:  [
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          defaultTextKeyboard(
              num: '1',
              amount: amount,
              context: context,
              id: id,
          ),
          defaultTextKeyboard(num: '2',
              amount: amount,
              context: context,
            id: id,
          ),
          defaultTextKeyboard(num: '3',
              amount: amount,
              id: id,
              context: context),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          defaultTextKeyboard(num: '4',
              amount: amount,
              id: id,
              context: context),
          defaultTextKeyboard(num: '5',
              amount: amount,
              id: id,
              context: context),
          defaultTextKeyboard(num: '6',
              amount: amount,
              id: id,
              context: context),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          defaultTextKeyboard(num: '7',
              amount: amount,
              id: id,
              context: context),
          defaultTextKeyboard(num: '8',
              amount: amount,
              id: id,
              context: context),
          defaultTextKeyboard(num: '9',
              amount: amount,
              id: id,
              context: context),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          defaultIconKeyboard(
              icon:Icon(
                Icons.backspace_outlined,
                color: Colors.white,
      ),
          onPressed: () {
            AppCubit.get(context).isBankAccountEmpty(
              text: amount,
              id: id,
            );
          }
          ),
          defaultTextKeyboard(num: '0',
              amount: amount,
              context: context,
              id: id,
          ),
          defaultIconKeyboard(
            icon:Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
          ),
              onPressed: onPressed,
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
    ],
  ),
);

//------------------------------------------------------------
Widget defaultTextKeyboard({
  required String num,
  required BuildContext context,
  required String amount,
  required int id,
})
{
  return Container(
    height: 50,
    width: 60,
    decoration: BoxDecoration(
      color: numberBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 20.0,
          offset: const Offset(5, 5),
        ),
      ],
    ),
    child: TextButton(
      onPressed: ( ) {
        // if(num == '0' && amount.length ==0){
        //
        // }
        AppCubit.get(context).addTextToBankAccount(
          num: num,
          amount: amount,
          id: id,
        );
      },
      child: Text(
          num,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold)),
    ),
  );
}
//------------------------------------------------------------
Widget defaultIconKeyboard( {
  required VoidCallback onPressed,
  required Icon icon,
  int? id,
}){
  return Container(
    height: 50,
    width: 60,
    decoration: BoxDecoration(
      color: numberBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 20.0,
          offset: const Offset(5, 5),
        ),
      ],
    ),
    child: TextButton(
      onPressed: onPressed,
      child: icon,
    ),
  );
}

//------------------------------------------------------------
Widget defaultLoading(){
  return AnimatedContainer(
    duration:const Duration(milliseconds: 800) ,
    curve: Curves.bounceIn,
    child: Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 200,
      backgroundColor: Colors.transparent,
      child: Center(
        child: SpinKitThreeBounce(
          color:Colors.white,
              // HexColor('#D8A616'),
          size: 50,
          duration: Duration(seconds: 3),

        ),
      ),
    ),

  );
}

//--------------------------------------------------------

Widget defaultBackgroundImage(){
  return Container(
    height: double.infinity,
    child: Image.asset(
      'images/shape.jpg',
      // fit: BoxFit.fill,
    ),
  );
}

//----------------------------------------------------

Widget defaultBankImage(){
  return Container(
    height: 20.0.h,
    width: double.infinity,
    child: Image.asset(
      'images/Picture20.png',
      fit: BoxFit.fill,
    ),
  );
}

//----------------------------------------------------

defaultShowButtomSheet({
  Icon? icon,
  context,

}
    ){
  return showModalBottomSheet(
      backgroundColor: primaryColor.withOpacity(1.0),
      context: context,
      builder: (context){
        return Container(
          width: double.infinity,
          height: 38.h,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(1.0),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.1),
                blurRadius: 10.0,
                spreadRadius: 10.0,
                // offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: icon,
            ),
          ),
        );
      }
  );
}

//----------------------------------------------------
Widget defaultTextFormNumber(
{required String text
}
    ){
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 40,
      end: 40,
      top: 20,
    ),
    child: Container(
      width: double.infinity,
      height: 65,
      padding: EdgeInsetsDirectional.only(
        top: 15,
        bottom: 15,
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
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Text(
            text,

            style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
            ),
          ),
        ],
      ),
    ),
  );
}

//'''EG${cubit.transferResult}'''