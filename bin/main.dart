// Copyright (c) 2017, thomashourlier. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:http/http.dart';

import 'package:intercom_test/intercom_test.dart';

main(List<String> arguments) async {
  final client = new Client();
  final settings = new LocatorSettings(
    endpoint:
        'https://gist.githubusercontent.com/brianw/19896c50afa89ad4dec3/raw/6c11047887a03483c50017c1d451667fd62a53ca/gistfile1.txt',
    officeLatitude: 53.3393,
    officeLongitude: -6.2576841,
  );

  final userService = new UserService(
    client,
    settings,
  );

  final userLocator = new UserLocator(userService, settings);

  final users = await userLocator.findNearestUser(100)
    ..sort();

  print(users);
}
