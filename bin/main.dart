// Copyright (c) 2017, thomashourlier. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:http/http.dart';

import 'package:intercom_exam/intercom_exam.dart';

main(List<String> arguments) async {
  final settings = new LocatorSettings(
    endpoint:
        'https://gist.githubusercontent.com/brianw/19896c50afa89ad4dec3/raw/6c11047887a03483c50017c1d451667fd62a53ca/gistfile1.txt',
    officePosition: new EarthPosition(53.3393, -6.2576841),
  );

  // Instantiates the [UserLocator] in respect of dependency injection
  final userLocator = new UserLocator(
    new UserService(
      new Client(),
      settings,
    ),
    settings,
  );

  print('=== FETCHING NEARED USERS FROM ${settings.officePosition} ===');

  final users = await userLocator.findOrderedNearestUsers(100);

  print('=== ORDERER NEAREST USERS: $users ===');
}
