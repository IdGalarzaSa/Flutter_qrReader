import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:meta/meta.dart';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({this.id, this.tipo, @required this.valor}) {
    if (this.valor.contains("http")) {
      tipo = "http";
    } else {
      tipo = "geo";
    }
  }

  int id;
  String tipo;
  String valor;

  LatLng getLatLong() {
    final latLong = this.valor.substring(4).split(",");
    final lat = double.parse(latLong[0]);
    final long = double.parse(latLong[1]);

    return LatLng(lat, long);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
