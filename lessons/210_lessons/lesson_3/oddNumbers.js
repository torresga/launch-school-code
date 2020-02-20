// Write a function that takes a positive integer as an argument, and logs all the odd numbers from 1 to the passed in number (inclusive). All numbers should be logged on separate lines.

// Example
// logOddNumbers(19);
//
// // output on console
// 1
// 3
// 5
// 7
// 9
// 11
// 13
// 15
// 17
// 19

// PEDAC:

// Understand the Problem:
//
// Input: a positive integer
// Output: the odd numbers from 1 to input, inclusive

// Rules:
// Each outputted number should be on a separate line.

// How do we know if a number is even or odd? We can divide a number by two and check if there is a remainder of 1. All odd numbers divided by two will have a remainder of 1.

// Algorithm

// 1. Create a variable to house our current number, currentNumber
// 2. Set currentNumber = 1
// 3. Loop While currentNumber <= input number
// 4.  If currentNumber % 2 === 1
// 5.    Output currentNumber
// 6. Add 1 to currentNumber

function logOddNumbers(inputNumber) {
  var currentNumber = 1;

  while (currentNumber <= inputNumber) {
    if (currentNumber % 2 === 1) {
      console.log(currentNumber);
    }

    currentNumber += 1;
  }
}

// You can remove the conditional inside the loop and increment i by 2 with each step, instead of 1. How would you write code to do that?

function logOddNumbers(inputNumber) {
  for (var i = 1; i <= inputNumber; i += 2) {
    console.log(i);
  }
}

// Instead of a conditional that checks for odd numbers, you can write a conditional that checks for even numbers, but skips them with the continue statement. How would you write your code?

function logOddNumbers(inputNumber) {
  for (var i = 1; i <= inputNumber; i++) {
    if (i % 2 === 0) {
      continue;
    }

    console.log(i);
  }
}

logOddNumbers(19);
