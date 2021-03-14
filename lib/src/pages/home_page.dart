import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_providers.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';
import 'package:qr_reader/src/tabs/scan_list_tab.dart';
import 'package:qr_reader/src/widgets/custom_navigatorBar.dart';
import 'package:qr_reader/src/widgets/qr_scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scansProvider = Provider.of<ScanListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(scansProvider.selectedType == "http" ? "Places" : "Maps"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                scansProvider.deleteScansByType(scansProvider.selectedType);
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: QRScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scansProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scansProvider.loadScansByType("geo");
        return ScanListTab("geo");
      case 1:
        scansProvider.loadScansByType("http");
        return ScanListTab("http");
      default:
        scansProvider.loadScansByType("geo");
        return ScanListTab("geo");
    }
  }
}
