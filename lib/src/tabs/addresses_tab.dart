import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_providers.dart';

class AddressesTab extends StatelessWidget {
  const AddressesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProviders = Provider.of<ScanListProvider>(context);
    final scans = scanProviders.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading:
              Icon(Icons.home_outlined, color: Theme.of(context).accentColor),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right_rounded,
              color: Theme.of(context).accentColor),
          onTap: () {
            print("${scans[index].valor} - ${scans[index].id}");
          },
        );
      },
    );
  }
}
