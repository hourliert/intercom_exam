// Copyright (c) 2017, thomashourlier. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:intercom_test/intercom_test.dart';

main(List<String> arguments) {
  final data = [
    1,
    [2, 3],
    4
  ];
  final res = flatten(data);

  print('Flattening: $data into $res');
}
