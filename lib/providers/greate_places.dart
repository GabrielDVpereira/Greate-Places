import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:greatPlaces/models/place.dart';
import 'package:greatPlaces/utils/db_util.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    Place newPlace = Place(
        title: title,
        image: image,
        id: Random().nextDouble().toString(),
        location: null);

    _items.add(newPlace);
    DbUtil.insert("places", {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
    notifyListeners();
  }
}
