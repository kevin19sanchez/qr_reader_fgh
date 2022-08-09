import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
        onPressed: () async {
          //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D88EF', 'Cancelar', false, ScanMode.QR);
          final barcodeScanRes = 'https://fernando-herrera.com';
          
          print(barcodeScanRes);
        },
      child: const Icon(Icons.filter_center_focus)
    );
  }
}
