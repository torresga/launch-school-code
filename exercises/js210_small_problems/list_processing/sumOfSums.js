// Sum of Sums
// Write a function that takes an array of numbers, and returns the sum of the sums of each leading subsequence for that array. You may assume that the array always contains at least one number.

// Input: An array of numbers
// Output: A single number
//
// Rules:
// - Return the sum of sums

// Maybe we can do this with two calls of reduce?
// Keep track of current sum value
// Then we have to get slices of the array - from element to all elements
//
// Algorithm
//
// 1. Reduce array:
//   For each element, we get the index of the current element
//   Add accumulator value to the result of another reduce call:
//     Add inner accumulator + slice of array from 0 to current index + 1

function sumOfSums(arr) {
  return arr.reduce(function(sum, current, index) {
    return sum + arr.slice(0, index + 1).reduce(function(innerSum, innerElem) {
      return innerSum + innerElem;
    });
  });
}

// Examples:

console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
