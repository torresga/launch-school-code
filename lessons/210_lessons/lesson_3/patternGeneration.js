// Pattern Generation
// Write a function that takes a number of rows as the argument n and logs a square of numbers and asterisks. For example, if n is 7, log the following pattern:
//
// generatePattern(7);
//
// // console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567
// You may assume that n is greater than 1 and less than 10.

// Input: a number greater than 1 and less than 10
// Output: A square of numbers and asterisks

// n is the length and width of the square
// i think the pattern is - i + (n - i)

// Algorithm:
// 0. Create a new string to hold the number sequence string
// 1. Loop from 1 to n
// 2.   Add current number to the sequence
// 3.   Loop n - current number times
// 4.     Create a string with n - current number asterisks
// 3.   Output sequence + asterisks

function generatePattern(squareLength) {
  var numberSequence = '';

  for (var i = 1; i <= squareLength; i++) {
    numberSequence += String(i);

    var asterisks = '';

    for (var j = 0; j < (squareLength - i); j++) {
      asterisks += '*';
    }

    console.log(numberSequence + asterisks);
  }
}

generatePattern(7);

generatePattern(20);
