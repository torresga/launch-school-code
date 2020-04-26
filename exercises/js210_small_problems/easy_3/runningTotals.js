// Running Totals
// Write a function that takes an array of numbers, and returns an array with the same number of elements, with each element's value being the running total from the original array.

// Input: An array of numbers
// Output: A new array of numbers

// Rules:
// - First element of new array is the first element of old array
// - Every element after the first is the previous element + current element
// - if input array is empty, return an empty array

// Data Structure
// input and output can remain an array

// Algorithm
// 1. Create a variable to hold the sum and assign it to 0
// 2. Loop through the array
// 3.  Add current element to sum
// 4.  Add sum to new array
// 5. Return new array

function runningTotal(arr) {
  var totals = [];
  var currentSum = 0;
  var i;

  for (i = 0; i < arr.length; i += 1) {
    currentSum += arr[i];
    totals.push(currentSum);
  }

  return totals;
}

// Further Exploration
// Can you rewrite the solution using the Array.prototype.map method? What types of problems do you think are well-suited for the Array.prototype.map method?

function runningTotal(arr) {
  var sum = 0;

  return arr.map(function(currentElement) {
    sum += currentElement;
    return sum;
  });
}


// Examples:

console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []
