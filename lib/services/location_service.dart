import 'dart:async';

import 'package:location/location.dart';
import 'package:sultan_delivery/services/user_location.dart';

class LocationService {
  // Keep track of current Location
  UserLocation _currentLocation;
  Location location = Location();

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _currentLocation;
  }
}