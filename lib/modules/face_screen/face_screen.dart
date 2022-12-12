import 'package:flutter/material.dart';
import 'package:project/components/components.dart';
import 'package:sizer/sizer.dart';

class FaceScreen extends StatelessWidget {
  const FaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: Column(
         children: [
           defaultBankImage(),
           Stack(
             alignment: AlignmentDirectional.bottomEnd,
             children: [
               defaultBackgroundImage(),
               Center(
                 child: Container(
                   width: 90.w,
                   height: 40.h,
                   decoration: BoxDecoration(
                     color: Colors.grey.shade200.withOpacity(0.8),
                     borderRadius: BorderRadiusDirectional.circular(15),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.25),
                         blurRadius: 15.0,
                        // offset: const Offset(5, 5),
                       ),
                     ],

                   ),

                 ),
               ),
               Center(
                 child: Container(
                     width: 60.w,
                    height: 30.h,
                   child: Image.asset(
                     'images/face.jpg',
                    fit: BoxFit.contain,
                   ),
                   ),
                 ),

             ],
           ),
         ],
       ),
        bottomSheet: buildBottomSheet(),

      ),
    );
  }
}
