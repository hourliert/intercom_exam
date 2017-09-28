// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_exam.service;

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'earth_position.dart';
import 'settings.dart';

part 'user.dart';

/// Interacts with the user API
class UserService {
  final Client _client;
  final LocatorSettings _settings;

  /// Creates a new [UserService]
  UserService(this._client, this._settings);

  /// Fetches a list of users
  ///
  /// The HTTP response should be JSON-line separated.
  Future<List<User>> fetchUsers() async {
    final response = await _client.get(_settings.endpoint);

    final rows = response.body.split('\n');
    final users = rows.map((r) => new User.fromJSON(JSON.decode(r))).toList();

    return users;
  }
}
