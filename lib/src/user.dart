// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

part of intercom_test.service;

class User implements Comparable<User> {
  final int id;
  final String name;
  final EarthPosition position;

  User.fromJSON(Map data)
      : id = data['user_id'],
        name = data['name'],
        position = new EarthPosition(
            num.parse(data['latitude']), num.parse(data['longitude']));

  @override
  String toString() => 'User: $id, $name, $position';

  @override
  int compareTo(User other) => id - other.id;
}
