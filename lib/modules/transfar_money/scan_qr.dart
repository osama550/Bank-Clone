import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

//ignore: must_be_immutable
class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String _scanBarcode = 'Unknown';
  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Scanner',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('1111111111111111');
                scanQR();
                print('22222222');
              },
              child: const Text(
                'Scan QR',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            if (getResult == 'waste_app_7_14')
              Text(
                'QR Code true => $getResult',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Future<void> scanQRCode() async {
  //   String qrCode;
  //   try {
  //     qrCode = await FlutterBarcodeScanner.scanBarcode(
  //       '#ff6666',
  //       'Cancel',
  //       true,
  //       ScanMode.QR,
  //     );
  //     if (!mounted) return;
  //     setState(() {
  //       getResult = qrCode;
  //     });
  //     print(
  //       "QRCode_Result:--",
  //     );
  //     print(qrCode);
  //   } on PlatformException {
  //     getResult = 'Failed to scan QR Code.';
  //   }on MissingPluginException {
  //     getResult =
  //     "No implementation found for method scanBarcode on channel flutter_barcode_scanner";
  //   }
  // }



  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }on MissingPluginException {

      barcodeScanRes =
      "No implementation found for method scanBarcode on channel flutter_barcode_scanner";
      print(barcodeScanRes);

    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }


  Future<void> ScanBarCode() async {
    String scanResult;
    print("Function  1111111111111");
    try {
      print("Function  2222222222222222");

      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(
          "456465455555554444444444444444444444444444444444444444444444444444444444555555555555555535555554$scanResult");
    } on PlatformException {
      scanResult = "Failed To Get Platform version.";
      print(scanResult);
    } on MissingPluginException {
      print("Function  3333333333333333333");

      scanResult =
      "No implementation found for method scanBarcode on channel flutter_barcode_scanner";
    }
    // if (context.mounted != true) return;
    if (mounted != true) return;

    // setState(() {
    //   this.scanResult = scanResult;
    //   // ShowToust(Text: scanResult, state: ToustStates.SUCSESS);
    //   // Fluttertoast.showToast(
    //   //     msg: "This is Center Short Toast",
    //   //     toastLength: Toast.LENGTH_SHORT,
    //   //     gravity: ToastGravity.CENTER,
    //   //     timeInSecForIosWeb: 1,
    //   //     backgroundColor: Colors.red,
    //   //     textColor: Colors.white,
    //   //     fontSize: 16.0);
    // });
    //
  }

}
