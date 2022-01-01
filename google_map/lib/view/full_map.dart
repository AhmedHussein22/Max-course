import 'package:flutter/material.dart';
import 'package:google_map/model/locatio_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LocationDetalis initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation = const LocationDetalis(-122.084,37.422),
    this.isSelecting = false,
  });
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
   LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
         actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.lagtude,

          ),
          zoom: 12,

        ),
       onTap: widget.isSelecting ? _selectLocation : null,
        markers: _pickedLocation == null
            ? {
                Marker(
                  markerId: MarkerId('m1'),
                  position: LatLng(widget.initialLocation.latitude, widget.initialLocation.lagtude),
                ),
              }
            : {
                Marker(
                  markerId: MarkerId('m2'),
                  position: _pickedLocation,
                ),
              },
      ),
    );
  }
}
