import 'package:flutter/material.dart';
import 'package:qr_reader/src/model/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  final type = scan.tipo;

  if (type == "http") {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  } else {
    await Navigator.pushNamed(context, "mapPage", arguments: scan);
  }
}
