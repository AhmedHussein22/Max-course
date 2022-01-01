
import 'dart:io';

import 'package:flutter/foundation.dart';
import '../model/locatio_model.dart';

class FetchLocatins extends ChangeNotifier {
  List<LocationData> _alllocations=[];
  List<LocationData> get alllocations {
    return [..._alllocations];
  }

  void addPlace(
    String pickedTitle,
    File pickedImage,
  ) {
    final newPlace = LocationData(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: null,
    );
    _alllocations.add(newPlace);
    notifyListeners();
  }
  
}