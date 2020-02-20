// Odd Numbers
// Log all odd numbers from 1 to 99, inclusive, to the console. Log all numbers on separate lines.

// Input: None
// Output: All odd numbers from 1 to 99 inclusive
//
// Data Structures
// Can deal with numbers

// Algorithm
// Create a variable for number and assign it to 0.
// While number is less than 100
//   If number is odd, output it to the console
//   Else
//     Go to the next number
//   Add 1 to number

// var currentNumber = 0;
// while (currentNumber < 100) {
//   if (currentNumber % 2 === 1) {
//     console.log(currentNumber);
//   }
//
//   currentNumber += 1;
// }

// another way:
// Create a variable for currentNumber and assign it to 1
// Loop while currentNumber <= 99
//   Output currentNumber
//   Add 2 to currentNumber

var currentNumber = 1;

while (currentNumber <= 99) {
  console.log(currentNumber);
  currentNumber += 2;
}
