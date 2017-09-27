// Copyright (c) 2017, thomashourlier. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:intercom_test/intercom_test.dart'
    show flatten, lowMemoryFlatten;
import 'package:test/test.dart';

class TestData {
  final List input;
  final List<int> output;

  TestData({this.input, this.output});
}

void main() {
  final dataSet = [
    new TestData(
      input: [
        1,
        [2, 3],
        4
      ],
      output: [1, 2, 3, 4],
    ),
    new TestData(
      input: [
        1,
        [2, 3],
        4
      ],
      output: [1, 2, 3, 4],
    ),
    new TestData(
      input: [],
      output: [],
    ),
    new TestData(
      input: [1],
      output: [1],
    ),
    new TestData(
      input: [
        1,
        [2, 3],
        4,
        [
          5,
          [
            6,
            [7]
          ],
          8
        ]
      ],
      output: [1, 2, 3, 4, 5, 6, 7, 8],
    ),
  ];

  test('flatten', () {
    dataSet.forEach((t) => expect(flatten(t.input), t.output));
  });

  test('lowMemoryFlatten', () {
    dataSet.forEach((t) => expect(lowMemoryFlatten(t.input), t.output));
  });
}
