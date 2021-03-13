import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_providers.dart';

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
        scanProvider.nuevoRegistro("geo: 15.16, 17.24");
      },
    );
  }
}
