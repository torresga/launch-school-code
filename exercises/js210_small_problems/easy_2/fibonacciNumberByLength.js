// Fibonacci Number Location by Length
// The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first two numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.
//
// Computationally, the Fibonacci series is a simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075—that's enormous, especially considering that it takes six iterations just to find the first 2-digit Fibonacci number.
//
// Write a function that calculates and returns the index of the first Fibonacci number that has the number of digits specified by the argument. (The first Fibonacci number has an index of 1.)
//
// You may assume that the argument is always an integer greater than or equal to 2.

// Input: An integer
// Output: The index of the first Fibonacci number that has the number of digits specified by integer

// Rules
// Problem says first Fibonacci number has an index of 1, so we should start at 1.
// Not using arrays in this problem

// Keep track of index, firstPreviousNumber and secondPreviousNumber
// Check length of number by converting to string and taking length

// Algorithm
// Assign index to 3, because now we are at the third number.
// Assign firstPreviousNumber, secondPreviousNumber to 1
// Loop while (String version of firstPreviousNumber + secondPreviousNumber's length is less than input length)
//   create a temp variable
//   assign temp to second
//   assign secondPreviousNumber to firstPreviousNumber + secondPreviousNumber
//   assign firstPreviousNumber to temp
//   add 1 to index
// Return index

function findFibonacciIndexByLength(numberOfDigits) {
  var index = 3;
  var first = 1;
  var second = 1;

  while (String(first + second).length < numberOfDigits) {
    var temp = second;
    second = first + second;
    first = temp;

    console.log(`first: ${first}, second: ${second}`);
    index += 1;
  }

  return index;
}

// Examples:

console.log(findFibonacciIndexByLength(2));       // 7
console.log(findFibonacciIndexByLength(10));      // 45
console.log(findFibonacciIndexByLength(16));      // 74
