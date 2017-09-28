// Copyright (c) 2017, thomashourlier. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:intercom_exam/intercom_exam.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'test_data.dart';

class UserServiceMock extends Mock implements UserService {}

class LocatorSettingsMock extends Mock implements LocatorSettings {}

void main() {
  final dataSet = [
    new TestData(
      input: 100,
      output: [
        new User(12, 'Christina McArdle'),
        new User(6, 'Theresa Enright'),
      ],
    )
  ];
  UserLocator locator;

  setUpAll(() {
    final userService = new UserServiceMock();
    final settings = new LocatorSettingsMock();

    when(userService.fetchUsers()).thenReturn(new Future.value([
      new User.fromJSON({
        "latitude": "52.986375",
        "user_id": 12,
        "name": "Christina McArdle",
        "longitude": "-6.043701"
      }),
      new User.fromJSON({
        "latitude": "53.1229599",
        "user_id": 6,
        "name": "Theresa Enright",
        "longitude": "-6.2705202"
      }),
      new User.fromJSON({
        "latitude": "51.92893",
        "user_id": 1,
        "name": "Alice Cahill",
        "longitude": "-10.27699"
      }),
    ]));

    when(settings.officePosition)
        .thenReturn(new EarthPosition(53.3393, -6.2576841));

    locator = new UserLocator(userService, settings);
  });

  test('findNearestUser', () async {
    for (var t in dataSet) {
      final users = await locator.findNearestUsers(t.input);

      expect(users, t.output);
    }
  });
}
