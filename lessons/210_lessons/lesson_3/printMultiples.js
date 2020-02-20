// Print Multiples
// Write a function logMultiples that takes one argument number. It should log all multiples of the argument between 0 and 100 (inclusive) that are also odd numbers. Log the values in descending order.
//
// You may assume that number is an integer between 0 and 100.
//
// Example
// logMultiples(17);
// // output (5x, 3x and 1x)
// 85
// 51
// 17
//
// logMultiples(21);
// // output (3x and 1x)
// 63
// 21

// Input: One number
// Output: Odd numbers that are multiples of input number, in descending order

// Loop should go from 100 to 0.
// Then we can print out the number if it's a multiple of the input number and odd

// Algorithm
// 1. Loop from 100 to 0.
// 2.   If current number is divisible by input number and current number is odd
// 3.     Output the number

function logMultiples(number) {
  for (var i = 100; i >= 0; i--) {
    if (i % number == 0 && i % 2 == 1) {
      console.log(i);
    }
  }
}

logMultiples(17);

console.log('\n');

logMultiples(21);

console.log('\n');

// This solution must step through every number between 100 and 0. Alternatively, you can determine the number's largest multiple that is less than 100, then start the loop with that multiple. With each iteration of the loop, you can decrement the number by the argument; when the result is negative, you can quit.

// As above, we must check each multiple to determine whether it is odd. If it is odd, we log it.

// Math.floor(100 / number) * number returns the largest multiple of number that is between 0 and 100. If you're not familiar with the floor method, see the documentation.

function logMultiples(number) {
  largestMultiple = Math.floor(100 / number) * number;

  for (var i = largestMultiple; i >= number; i -= number) {
    if (i % 2 == 1) {
      console.log(i);
    }
  }
}

logMultiples(17);

console.log('\n');

logMultiples(21);
