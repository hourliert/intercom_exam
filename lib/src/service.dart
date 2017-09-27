// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_test.service;

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'settings.dart';

part 'user.dart';

class UserService {
  final Client _client;
  final LocatorSettings _settings;

  UserService(this._client, this._settings);

  Future<List<User>> fetchUser() async {
    final response = await _client.get(_settings.endpoint);

    final rows = response.body.split('\n');
    final users = rows.map((r) => new User.fromJSON(JSON.decode(r))).toList();

    return users;
  }
}
