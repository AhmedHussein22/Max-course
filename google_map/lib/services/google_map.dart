const Api_Key="AIzaSyDsAJ6ZrJg2yzLUgBUNJNZGJkIers7iJ_Y";
class GetGoogleMap {
  static String getlocation(double lan,double lat){
    return "https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$lan&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$lan&key=$Api_Key";
  }
  
}