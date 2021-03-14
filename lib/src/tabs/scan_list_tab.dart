import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_providers.dart';
import 'package:qr_reader/src/utils/utils.dart';

class ScanListTab extends StatelessWidget {
  final String _type;

  ScanListTab(this._type);

  @override
  Widget build(BuildContext context) {
    final scanProviders = Provider.of<ScanListProvider>(context);
    final scans = scanProviders.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            child: Center(
              child: Text(
                "Removing",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            color: Theme.of(context).accentColor,
          ),
          key: Key(scans[index].id.toString()),
          onDismissed: (DismissDirection direction) {
            Provider.of<ScanListProvider>(context, listen: false)
                .deleteScansById(scans[index].id);
          },
          child: ListTile(
            leading: Icon(
              _type == "http" ? Icons.house_outlined : Icons.map_outlined,
              color: Theme.of(context).accentColor,
            ),
            title: Text(scans[index].valor),
            subtitle: Text(scans[index].id.toString()),
            trailing: Icon(Icons.keyboard_arrow_right_rounded,
                color: Theme.of(context).accentColor),
            onTap: () {
              launchURL(context, scans[index]);
            },
          ),
        );
      },
    );
  }
}
