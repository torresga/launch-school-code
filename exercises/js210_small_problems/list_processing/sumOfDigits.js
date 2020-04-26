// Sum of Digits
// Write a function that takes one argument, a positive integer, and returns the sum of its digits. Do this using list processing techniques.
//

// Input: A positive integer
// Output: A sum of its Digits
//
// Algorithm
// 1. Turn number into string
// 2. Split string by Digits
// 3. Map string into numbers
// 4. Use the reduce method to add digits together

function sum(number) {
  return String(number).split('')
                       .map((digit) => Number(digit))
                       .reduce((sum, digit) => sum + digit);
}

// Examples:

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45
