// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

part of intercom_test.service;

class User implements Comparable<User> {
  final int id;
  final String name;
  final num latitude;
  final num longitude;

  User.fromJSON(Map data)
      : id = data['user_id'],
        name = data['name'],
        latitude = num.parse(data['latitude']),
        longitude = num.parse(data['longitude']);

  @override
  String toString() => '$id, $name';

  @override
  int compareTo(User other) => id - other.id;
}
