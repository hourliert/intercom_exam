// Copyright (c) 2017, thomashourlier. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:intercom_exam/intercom_exam.dart';
import 'package:test/test.dart';

void main() {
  final dataSet = [];

  test('flatten', () {
    dataSet.forEach((t) => expect(flatten(t.input), t.output));
  });
}
