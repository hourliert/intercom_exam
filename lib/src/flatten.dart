// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

library intercom_test.flatten;

/// Flattens an n-dimension array of int into a 1-array of int.
List<int> flatten(List array) {
  if (array.isEmpty) {
    return [];
  }

  final head = array.first;
  final tail = array.sublist(1);

  if (head is int) {
    return [head]..addAll(flatten(tail));
  } else {
    return flatten(head)..addAll(flatten((tail)));
  }
}

/// Flattens an n-dimension array of int into a 1-array of int.
///
/// This function uses less memory than [flatten].
List<int> lowMemoryFlatten(List array, [int index = 0]) {
  if (index >= array.length) {
    return [];
  }

  final head = array[index];

  if (head is int) {
    return [head]..addAll(lowMemoryFlatten(array, index + 1));
  } else {
    return lowMemoryFlatten(head)..addAll(lowMemoryFlatten(array, index + 1));
  }
}
