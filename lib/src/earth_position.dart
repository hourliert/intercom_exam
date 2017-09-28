// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_exam.earth_position;

import 'dart:math';

num _toRadians(num degrees) {
  return degrees * PI / 180;
}

const int earthRadius = 6371;

/// Represents a position on earth.
class EarthPosition {
  /// Position latitude in degrees
  final num latitude;

  /// Position longitude in degrees
  final num longitude;

  /// Creates a new [EarthPosition]
  EarthPosition(this.latitude, this.longitude);

  /// Computes the distance between this position and other.
  num distanceTo(EarthPosition other) {
    final phi1 = _toRadians(latitude);
    final phi2 = _toRadians(other.latitude);
    final deltaLambda = _toRadians(other.longitude - longitude);
    final deltaSigma =
        acos(sin(phi1) * sin(phi2) + cos(phi1) * cos(phi2) * cos(deltaLambda));

    return earthRadius * deltaSigma;
  }

  /// Computes the distance between 2 [EarthPosition].
  static distanceBetween(EarthPosition p1, EarthPosition p2) =>
      p1.distanceTo(p2);

  @override
  String toString() => 'EarthPosition: $latitude, $longitude';
}
