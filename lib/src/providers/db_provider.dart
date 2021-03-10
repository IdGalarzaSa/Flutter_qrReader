import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/src/model/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();
  Future<Database> get getDatabase async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final databasePath = join(documentsDirectory.path, 'ScanQr.db');
    print(databasePath);

    return await openDatabase(databasePath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
    });
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await getDatabase;
    final res = await db.insert('Scan', newScan.toJson());
    return res;
  }

  Future<ScanModel> getScanById(int id) async {
    final db = await getDatabase;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await getDatabase;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await getDatabase;
    final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [type]);

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await getDatabase;
    final res = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }

  Future<int> deleteScan(ScanModel newScan) async {
    final db = await getDatabase;
    final res =
        await db.delete('Scans', where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await getDatabase;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }
}
