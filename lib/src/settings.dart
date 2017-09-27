// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_test.settings;

import 'earth_position.dart';

class LocatorSettings {
  final String endpoint;
  final EarthPosition officePosition;

  LocatorSettings({this.endpoint, this.officePosition});
}
