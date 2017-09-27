// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_test.client;

import 'dart:async';
import 'dart:math';

import 'service.dart';
import 'settings.dart';

num toRadians(num degrees) {
  return degrees * PI / 180;
}

num toDegrees(num radians) {
  return radians * 180 / PI;
}

const earthRadius = 6371;

class UserLocator {
  final UserService _service;
  final LocatorSettings _settings;

  UserLocator(this._service, this._settings);

  Future<List<User>> findNearestUser(num radius) async {
    final users = await _service.fetchUser();

    final teta1 = toRadians(_settings.officeLatitude);

    return users.where((u) {
      final teta2 = toRadians(u.latitude);

      final deltaLambda = toRadians(u.longitude - _settings.officeLongitude);

      final deltaSigma = acos(
          sin(teta1) * sin(teta2) + cos(teta1) * cos(teta2) * cos(deltaLambda));

      final distance = earthRadius * deltaSigma;

      return distance < radius;
    }).toList();
  }
}
