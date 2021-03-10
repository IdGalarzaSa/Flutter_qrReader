import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QRScanButton extends StatelessWidget {
  const QRScanButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () {},
      child: Icon(Icons.qr_code),
    );
  }
}
