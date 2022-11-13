import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/components.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#35383F'),
      appBar: AppBar(
        backgroundColor: HexColor('#35383F'),
        elevation: 0,
        leading: defaultIconButton(
          context: context,
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('#35383F')
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Scan and Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0.sp
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Please paint the camera at the QR Code ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0.sp
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.0,),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: QrImage(
                    data: "islam0552841664",
                    version: 4,
                    size: 60.0.w,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
