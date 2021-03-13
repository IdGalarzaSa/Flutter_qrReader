import 'package:flutter/material.dart';
import 'package:qr_reader/src/model/scan_model.dart';
import 'package:qr_reader/src/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = "http";

  nuevoRegistro(String qrValue) async {
    final newScan = new ScanModel(valor: qrValue);
    final newScanId = await DBProvider.db.newScan(newScan);

    newScan.id = newScanId;

    if (newScan.tipo == selectedType) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  loadAllScans() async {
    final scansFromDb = await DBProvider.db.getAllScans();
    scans = [...scansFromDb];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scansFromDb = await DBProvider.db.getScansByType(type);
    scans = [...scansFromDb];
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScansById(int id) async {
    await DBProvider.db.deleteScanById(id);
    loadScansByType(selectedType);
  }
}
