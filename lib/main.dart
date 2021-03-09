import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/pages/home_page.dart';
import 'package:qr_reader/src/pages/map_page.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => UIProvider()),
      ],
      child: MaterialApp(
        title: 'QR reader',
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => HomePage(),
          'mapPage': (BuildContext context) => MapPage()
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
