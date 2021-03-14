import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_providers.dart';
import 'package:qr_reader/src/utils/utils.dart';

class QRScanButton extends StatelessWidget {
  const QRScanButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.qr_code),
      onPressed: () async {
        final scanProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //   "#3D8BEF", // Color hexadecimal, que es el color de la línea en la superposición del código de barras.
        //   "Cancel", // Texto del botón cancelar en la pantalla
        //   true, // Valor bool utilizado para mostrar u ocultar el icono de flash
        //   ScanMode.QR, // Tipo de escaneo
        // );

        String barcodeScanRes = "";

        if (barcodeScanRes == '-1') {
          return;
        }

        final scan =
            await scanProvider.nuevoRegistro("geo:-16.503293,-68.142209");
        // final scan = await scanProvider.nuevoRegistro("https://flutter.dev/");

        launchURL(context, scan);
      },
    );
  }
}
