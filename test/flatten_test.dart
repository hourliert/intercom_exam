// Copyright (c) 2017, thomashourlier. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:intercom_exam/intercom_exam.dart'
    show flatten, lowMemoryFlatten;
import 'package:test/test.dart';

import 'test_data.dart';

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

  test('naive', () {
    dataSet.forEach((t) => expect(flatten(t.input), t.output));
  });

  test('low memory', () {
    dataSet.forEach((t) => expect(lowMemoryFlatten(t.input), t.output));
  });
}
