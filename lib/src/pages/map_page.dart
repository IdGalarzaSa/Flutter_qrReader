import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_reader/src/model/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.hybrid;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    final CameraPosition initialPoint =
        CameraPosition(target: scan.getLatLong(), zoom: 17.5, tilt: 20);
    // Marcadores
    final Set<Marker> markers = new Set<Marker>();
    markers.add(
      new Marker(markerId: MarkerId("${scan.id}"), position: scan.getLatLong()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on_rounded),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller
                  .animateCamera(CameraUpdate.newCameraPosition(initialPoint));
            },
          )
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        myLocationButtonEnabled: false,
        initialCameraPosition: initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.hybrid;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
