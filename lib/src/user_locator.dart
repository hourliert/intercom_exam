// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_exam.locator;

import 'dart:async';

import 'service.dart';
import 'settings.dart';

/// Represents a user locator
///
/// This object is able to retrieve users on a API and find all users in the radius
/// from the [LocatorSettings.officePosition].
class UserLocator {
  final UserService _service;
  final LocatorSettings _settings;

  /// Creates a new UserLocator
  UserLocator(this._service, this._settings);

  /// Finds the nearest users within [radius]
  Future<List<User>> findNearestUsers(num radius) async {
    final users = await _service.fetchUsers();

    return users
        .where((u) => u.position.distanceTo(_settings.officePosition) < radius)
        .toList();
  }

  /// Finds the nearest users within [radius] and order them by ID ascending
  Future<List<User>> findOrderedNearestUsers(num radius) async =>
      await findNearestUsers(radius)
        ..sort();
}
