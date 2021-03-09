import 'package:flutter/material.dart';
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
