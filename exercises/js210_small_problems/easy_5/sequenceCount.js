// Sequence Count
// Create a function that takes two integers as arguments. The first argument is a count, and the second is the starting number of a sequence that your function will create. The function should return an array containing the same number of elements as the count argument. The value of each element should be a multiple of the starting number.
//
// You may assume that the count argument will always be an integer greater than or equal to 0. The starting number can be any integer. If the count is 0, the function should return an empty array.

// Input: Two integers
// Output: An array
//
// First argument is the length of the resulting array
// Second argument is the starting number of the Sequence
// Each element in the resulting array should be a multiple of the second argument
// First argument will always be an integer >= 0, while second argument can be any integer
// If first argument is 0, return an empty array

// Data Structures
// dealing with arrays - both as the 'internal' data structure and the return value

// Algorithm
// 0. Return [] if count is zero
// 1. Create new array to hold sequence
// 2. Loop from 1 to count inclusive
// 3.   Multiply current number * starting number
// 4.   Add result to sequence
// 5. Return sequence

function sequence(count, start) {
  var sequence = [];
  var i;

  for (i = 1; i <= count; i += 1) {
    sequence.push(i * start);
  }

  return sequence;
}

// Examples:

console.log(sequence(5, 1)); // [1, 2, 3, 4, 5]
console.log(sequence(4, -7)); // [-7, -14, -21, -28]
console.log(sequence(3, 0)); // [0, 0, 0]
console.log(sequence(0, 1000000)); // []
