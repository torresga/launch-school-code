// Array Comparison
// The array comparison function that we implemented in the Arrays lesson (Alternate link if the previous link doesn't work) implicitly assumed that when comparing two arrays, any matching values must also have matching index positions. The objective of this exercise is to reimplement the function so that two arrays containing the same values—but in a different order—are considered equal. For example, [1, 2, 3] === [3, 2, 1] should return true.
//

// Input: Two Arrays
// Output: a boolean - true if the arrays both contain the same values, or false otherwise
//
// - values in either array can be in any order
// - both arrays have to contain the same values
// - arrays that aren't the same length are automatically false
//
// Return false if array lengths are different
// Sort first array
// Sort second array
// Loop through first array
//  Return false if second array at the same index does not equal current element at first array
// Return true

// Examples:

function areArraysEqual(array1, array2) {
  var sorted_array1 = array1.sort();
  var sorted_array2 = array2.sort();
  var i;

  if (array1.length !== array2.length) {
    return false;
  }

  for (i = 0; i < array1.length; i += 1) {
    if (array2[i] !== array1[i]) {
      return false;
    }
  }

  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true
