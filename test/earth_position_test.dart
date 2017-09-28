// Copyright (c) 2017, thomashourlier. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:intercom_exam/intercom_exam.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  final dataSet = [
    new TestData(
      input: {
        'a': [51.507351, -0.127758], // London
        'b': [48.856614, 2.352222], // Paris
      },
      output: 343.53,
    ),
    new TestData(
      input: {
        'a': [34.052234, -118.243685], // Los Angeles
        'b': [39.904200, 116.407396], // Beijing
      },
      output: 10061.25,
    ),
    new TestData(
      input: {
        'a': [53.3393, -6.2576841], // Dublin Intercom
        'b': [
          48.858694,
          2.442857
        ], // My Home: 36 rue de Stalingrad, 93100 Montreuil
      },
      output: 784.72,
    ),
  ];

  test('distanceTo', () {
    dataSet.forEach((t) {
      final position1 = new EarthPosition(t.input['a'][0], t.input['a'][1]);
      final position2 = new EarthPosition(t.input['b'][0], t.input['b'][1]);

      expect(position1.distanceTo(position2).toInt(), t.output.toInt());
    });
  });

  test('distanceBetween', () {
    dataSet.forEach((t) {
      final position1 = new EarthPosition(t.input['a'][0], t.input['a'][1]);
      final position2 = new EarthPosition(t.input['b'][0], t.input['b'][1]);

      expect(EarthPosition.distanceBetween(position1, position2).toInt(),
          t.output.toInt());
    });
  });
}
