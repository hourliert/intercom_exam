// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_test.locator;

import 'dart:async';

import 'service.dart';
import 'settings.dart';

class UserLocator {
  final UserService _service;
  final LocatorSettings _settings;

  UserLocator(this._service, this._settings);

  Future<List<User>> findNearestUser(num radius) async {
    final users = await _service.fetchUser();

    return users
        .where((u) => u.position.distanceTo(_settings.officePosition) < radius)
        .toList()
          ..sort();
  }
}
