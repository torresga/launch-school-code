// Multiply Lists
// Write a function that takes two array arguments, each containing a list of numbers, and returns a new array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

// Input: Two array arguments each containing numbers
// Output: A new array containing the product of each pair

// Rules:
// - each input array has the same number of elements
// - elements that have the same index form a pair
// - each number in pair is multiplied together to form the numbers in the new array
//
// Data Structure
// arrays
//
// Algorithm
// Create new array
// Loop over first array
//  Multiply current element from first array * current element from second array
// Add result of multiplication to new array
// Return new array

function multiplyList(firstArray, secondArray) {
  var multiplied = [];
  var result;
  var i;

  for (i = 0; i < firstArray.length; i += 1) {
    result = firstArray[i] * secondArray[i];
    multiplied.push(result);
  }

  return multiplied;
}

// Example:

console.log(multiplyList([3, 5, 7], [9, 10, 11]));    // [27, 50, 77]
