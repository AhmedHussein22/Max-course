import 'package:flutter/material.dart';
import '../model/locatio_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../view/full_map.dart';
import 'package:location/location.dart';

class SelecteLocation extends StatefulWidget {
  @override
  _SelecteLocationState createState() => _SelecteLocationState();
}

class _SelecteLocationState extends State<SelecteLocation> {
  String _url;
  //LocationData _location ;
  Future<void> _getcurrentLocation() async {
    final location = await Location().getLocation();
    //final statusUrl =GetGoogleMap.getlocation(location.longitude, location.latitude);
        setState(() {
         // _url=statusUrl;
          //_location=location;
        });
  }
 Future<void> _selectOnMap() async {
    print("_selectOnMap");
    final location = await Location().getLocation();
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
              isSelecting: true,
              initialLocation: LocationDetalis(location.longitude,location.latitude),
            ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    print(selectedLocation.latitude);
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 200,
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.purple),
            ),
          ),
          child: _url != null
              ? Image.network(
                  _url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text("No Selected Location"),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton.icon(
              color: Colors.purple,
              label: Text("Current Location",
                  style: TextStyle(color: Colors.white)),
              onPressed: () => _getcurrentLocation(),
              icon: Icon(
                Icons.location_history,
              ),
            ),
            RaisedButton.icon(
              color: Colors.purple,
              label:
                  Text("Pick Location", style: TextStyle(color: Colors.white)),
              onPressed: ()  {
                print("onPressed");
                _selectOnMap();
              },
              icon: Icon(Icons.add_location),
            ),
          ],
        )
      ],
    );
  }
}
