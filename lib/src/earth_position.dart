// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_test.earth_position;

import 'dart:math';

num _toRadians(num degrees) {
  return degrees * PI / 180;
}

const int earthRadius = 6371;

class EarthPosition {
  final num latitude;
  final num longitude;

  EarthPosition(this.latitude, this.longitude);

  num distanceTo(EarthPosition other) {
    final phi1 = _toRadians(latitude);
    final phi2 = _toRadians(other.latitude);
    final deltaLambda = _toRadians(other.longitude - longitude);
    final deltaSigma =
        acos(sin(phi1) * sin(phi2) + cos(phi1) * cos(phi2) * cos(deltaLambda));

    return earthRadius * deltaSigma;
  }

  @override
  String toString() => 'EarthPosition: $latitude, $longitude';
}
