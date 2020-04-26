// Combine Two Lists
// Write a function that combines two arrays passed as arguments, and returns a new array that contains all elements from both array arguments, with each element taken in alternation.
//
// You may assume that both input arrays are non-empty, and that they have the same number of elements.
//

// Input: two arrays
// Output: a new array\

// Rules:
// - input arrays are non-empty
// - input arrays have the same number of elements
// - two inputs have elements alternating in new array
//
// Data Structure
// arrays
//
// Algorithm
// Create new array
// Loop from 0 to array.length
//   push element from first array to new array
//   push element from second array to new array
// return new array

function interleave(firstArray, secondArray) {
  var interleaved = [];
  var i;

  for (i = 0; i < firstArray.length; i += 1) {
    interleaved.push(firstArray[i]);
    interleaved.push(secondArray[i]);
  }

  return interleaved;
}

// Example:

console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]
