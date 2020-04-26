// Multiply All Pairs
// Write a function that takes two array arguments, each containing a list of numbers, and returns a new array containing the products of all combinations of number pairs that exist between the two arrays. The returned array should be sorted in ascending numerical order.
//
// You may assume that neither argument will be an empty array.

// Input: two arguments, each is an array of numbers
// Output: a new array containing the products of all combination of number pairs that exist between the arrays.
//
// Rules:
// - assumption is that neither argument will be an empty array
// - the new array is sorted in ascending numerical order (lowest to highest)
//
// Data Structure
// Working with arrays
//
// Algorithm
// 1. Map first array
//   For each element, multiply number times each number in second array
//
//   So our first array will now look like this:
//   [[8, 6, 2, 4], [16, 12, 4, 8]];
//
// 2. Flatten array
//
// 3. Sort array in numerical order - since sort default sorts by strings, we are going to have to write a function that returns a number

function multiplyAllPairs(first, second) {
  return first.flatMap(function(firstElem) {
    return second.map(function(secondElem) {
      return secondElem * firstElem;
    });
  }).sort(function(a, b) {
    return a - b;
  });
}

//
// Example:

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]

// 2 x [4, 3, 1, 2] = 8, 6, 2, 4
// 4 x [4, 3, 1, 2] = 16, 12, 4, 8
// [8, 6, 2, 4] + [16, 12, 4, 8] = [8, 6, 2, 4, 16, 12, 4, 8]
// Array sorted is [8, 6, 2, 4, 16, 12, 4, 8]
// is [2, 4, 4, 6, 8, 8, 12, 16]

console.log(multiplyAllPairs([1, 3, 5], [4, 3, 1, 2])); // [1, 2, 3, 3, 4, 5, 6, 9, 10, 12, 15, 20]

// 1 * [4, 3, 1, 2] = [4, 3, 1, 2]
// 3 * [4, 3, 1, 2] = [12, 9, 3, 6]
// 5 * [4, 3, 1, 2] = [20, 15, 5, 10]
//
// [4, 3, 1, 2, 12, 9, 3, 6, 20, 15, 5, 10]
// sorted: [1, 2, 3, 3, 4, 5, 6, 9, 10, 12, 15, 20]
