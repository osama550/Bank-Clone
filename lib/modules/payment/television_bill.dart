import 'package:flutter/material.dart';
import 'package:project/components/components.dart';

class TelevisionBill extends StatelessWidget {
  const TelevisionBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            paymentBill(
              context: context,
              screenTitle: 'Television',
              imagePath: 'images/Picture12.png',
              imageHeader: 'Pay Television Bill',
              payType: 'television',
            ),
            bill(
              price: '\$500',
              name: 'Islam Ahmed',
              bankAccount: '0552841664',
            ),
            paymentButton(context: context),
         //    const SizedBox(
         //      height: 10.0,
         //    ),
         //    Row(
         //      children: [
         //        IconButton(
         //          onPressed: (){},
         //          icon: Icon(
         //            Icons.arrow_back_ios_rounded,
         //            color: primaryColor,
         //          ),
         //        ),
         //        const SizedBox(
         //          width: 5.0,
         //        ),
         //        Text(
         //          'Electricity',
         //          style: TextStyle(
         //            fontWeight: FontWeight.bold,
         //            fontSize: 15.sp,
         //          ),
         //        ),
         //        const Spacer(),
         //        Padding(
         //          padding: const EdgeInsets.only(
         //            right: 10.0,
         //          ),
         //          child: Image.asset(
         //            'images/Picture14.png',
         //            width: 18.w,
         //            height: 7.h,
         //            fit: BoxFit.fill,
         //          ),
         //        ),
         //      ],
         //    ),
         //    const SizedBox(
         //      height: 20.0,
         //    ),
         //    Image.asset(
         //      'images/Picture2.png',
         //      width: 20.w,
         //      height: 10.h,
         //      fit: BoxFit.fill,
         //    ),
         //    const SizedBox(
         //      height: 8.0,
         //    ),
         //    Text(
         //      'Pay Electricity Bill',
         //      style: TextStyle(
         //        fontWeight: FontWeight.bold,
         //        fontSize: 18.sp,
         //      ),
         //    ),
         //    const SizedBox(
         //      height: 5.0,
         //    ),
         //    Text(
         //      '''pay electricity bill safely , conveniently & easily .
         // you can pay anytime and anywhere!''',
         //      style: TextStyle(
         //        fontSize: 10.sp
         //      ),
         //    ),
         //    Padding(
         //      padding: EdgeInsets.symmetric(
         //        horizontal: 20.w,
         //      ),
         //      child: Divider(
         //        color: Colors.grey.shade100,
         //        thickness: 1.8,
         //      ),
         //    ),
         //    const SizedBox(
         //      height: 10.0,
         //    ),



            //Second Half Of PaymentScreen



            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 6.w,
            //     vertical: 5.h
            //   ),
            //   child: Container(
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadiusDirectional.circular(8.0),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.3),
            //           spreadRadius: 3,
            //           blurRadius: 6,
            //           offset: Offset(4, 5), // changes position of shadow
            //         ),
            //       ],
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(15.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Center(
            //             child: CircleAvatar(
            //               backgroundColor: HexColor('#DCDDE1'),
            //               radius: 40.0,
            //               child: const Center(
            //                 child: Icon(
            //                   Icons.person,
            //                   color: Colors.white,
            //                   size: 65.0,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 15.0,
            //           ),
            //           Divider(
            //             color: Colors.grey.shade100,
            //             thickness: 1,
            //           ),
            //           const SizedBox(
            //             height: 20.0,
            //           ),
            //           paymentData(
            //             title: 'Bill(USD)',
            //             answer: '\$500',
            //           ),
            //           const SizedBox(
            //             height: 20.0,
            //           ),
            //           paymentData(
            //             title: 'Name',
            //             answer: 'Islam Ahmed',
            //           ),
            //           const SizedBox(
            //             height: 20.0,
            //           ),
            //           paymentData(
            //             title: 'Bank Account',
            //             answer: '05528416525464',
            //           ),
            //           const SizedBox(
            //             height: 20.0,
            //           ),
            //           Row(
            //             children: [
            //               Text(
            //                 'Status',
            //                 style: TextStyle(
            //                   fontSize: 16.sp,
            //                   fontWeight: FontWeight.w300,
            //                 ),
            //               ),
            //               const Spacer(),
            //               Container(
            //                 decoration: BoxDecoration(
            //                   color: Colors.red,
            //                   borderRadius: BorderRadiusDirectional.circular(10.0),
            //                 ),
            //                 clipBehavior: Clip.antiAliasWithSaveLayer,
            //                 child: const Padding(
            //                   padding: EdgeInsets.symmetric(
            //                     horizontal: 18.0,
            //                     vertical: 5.0,
            //                   ),
            //                   child: Text(
            //                     'unpaid',
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.w400,
            //                       fontSize: 20.0,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10.0,
            // ),
          ],
        ),
      ),
    );
  }
}
