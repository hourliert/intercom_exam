// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_exam.settings;

import 'earth_position.dart';

/// Application wide settings
class LocatorSettings {
  /// API endpoint to fetch users
  final String endpoint;

  /// Intercom office position
  final EarthPosition officePosition;

  /// Creates a new [LocatorSettings]
  LocatorSettings({this.endpoint, this.officePosition});
}
