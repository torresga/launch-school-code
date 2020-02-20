// Practice Problems: Find Missing Numbers
// Write a function that takes a sorted array of integers as an argument, and returns an array that includes all the missing integers (in order) between the first and last elements of the argument.

// Input: A sorted array of integers. Integers can be negative.
// Output: An array that includes all the missing integers in order between the first and the last elements.
//
// Integers can be negative
// If there are no numbers missing between first and last elements, return an empty array
// If there's only one element in the array, return an empty array.
// There is supposed to be +1 between each element. If current element + 1 does not equal the next element, then we have to loop from current element to next element to fill in the gaps.

// Algorithm
// Create new array
// Loop through the array from 0 to the array.length
//   If current element's value + 1 does not equal next element
//     Loop from current element + 1 to the next element
//       Add current element to the array
// Return new array

function missing(array) {
  var result = [];

  var i;
  var j;
  for (i = 0; i < array.length; i += 1) {
    if ((array[i] + 1) != array[i + 1]) {
      for (j = array[i] + 1; j < array[i + 1]; j += 1) {
        result.push(j);
      }
    }
  }

  return result;
}

// Examples:

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []
