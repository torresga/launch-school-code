// Array Shift and Unshift
// In this exercise, you will implement your own versions of the Array.prototype.shift and Array.prototype.unshift methods. These methods manipulate the contents of an array starting from the first index.
//
// The shift method removes the first element from an array and returns that element; if the array is empty, shift returns undefined. The unshift method adds one or more elements to the start of an array and returns the new length of the array. Both methods mutate the original array.

// shift
// Input: An array
// Output: The first element of the array

// Takes an array, removes the first element, and returns that first element
// Mutates the original array
// Returns undefined if input array is empty

// Algorithm
// Create variable for firstElement
// If input array is empty, return undefined
// Assign firstElement to array[0]
// Then call splice on the array to remove that first element
// Return firstElement


function shift(array) {
  if (array.length === 0) {
    return undefined;
  }

  var firstElement = array[0];
  array.splice(0, 1);
  return firstElement;
}
// Examples:

console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

// Unshift
// Input: An array and one or more elements
// Output: the new length of the array
// Mutates the array

// Note: with the real unshift, the first argument is always the first element of the array.

// Algorithm
// Loop through the arguments backwards from length - 1 down to 1
//  Splice current argument in the array at index 0, with deleted elements 0
// Return length of array

function unshift(array) {
  var i;
  for (i = arguments.length - 1; i >= 1; i -= 1) {
    array.splice(0, 0, arguments[i]);
  }

  return array.length;
}

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

var testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]
