import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';
import 'package:qr_reader/src/tabs/addresses_tab.dart';
import 'package:qr_reader/src/tabs/maps_tab.dart';
import 'package:qr_reader/src/widgets/custom_navigatorBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Direcciones"),
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: Icon(Icons.place),
      ),
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

    switch (currentIndex) {
      case 0:
        return MapsTab();
      case 1:
        return AddressesTab();
      default:
        return MapsTab();
    }
  }
}
