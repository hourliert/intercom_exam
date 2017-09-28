// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

part of intercom_test.service;

/// Represents a user
///
/// It as a name, and id and a position on earth.
class User implements Comparable<User> {
  /// The user id
  final int id;

  /// The user name
  final String name;

  /// The user position on Earth
  final EarthPosition position;

  /// Creates a new User
  User(this.id, this.name, [this.position]);

  /// Creates a new User from a JSON map
  User.fromJSON(Map data)
      : id = data['user_id'],
        name = data['name'],
        position = new EarthPosition(
            num.parse(data['latitude']), num.parse(data['longitude']));

  @override
  String toString() => 'User: $id, $name, $position';

  @override
  int compareTo(User other) => id - other.id;

  @override
  bool operator ==(other) {
    if (other is User) {
      return id == other.id && name == other.name;
    }

    return false;
  }
}
