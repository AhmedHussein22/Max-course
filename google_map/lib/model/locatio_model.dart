import 'dart:io';
class LocationDetalis {
  final double lagtude;
  final double latitude;
 const LocationDetalis(this.lagtude, this.latitude);}
class LocationData {
  final String id;
  final String title;
  final File image;
  final LocationDetalis location;

  LocationData({this.id, this.title, this.image, this.location});
  
}