// Convert a Number to a String
// In the previous two exercises, you developed functions that convert simple numeric strings to signed integers. In this exercise and the next, you're going to reverse those functions.
//
// You will learn more about converting strings to numbers by writing a function that takes a positive integer or zero, and converts it to a string representation.
//
// You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. Your function should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

// Input: A number
// Output: A string

// Algorithm
// 1. Convert number into an array
//  We need to get each number from ones place, tens place, hundreds, etc
//  Maybe we can take a hint from digits array, it returns an array with digits backwards 4321 - [1, 2, 3, 4]
// Loop while number is greater than 0
//  Add remainder of number % 10 to new array
//  Assign number to number / 10 rounded down
// Return array.reversed
// 2. Convert array into a string
// Create new string
// Loop through array
//   Add current element to a new string

function integerToArray(int) {
  var integers = [];

  if (int === 0) {
    integers.push(0);
  }

  while (int > 0) {
    integers.push(int % 10);
    int = Math.floor(int / 10);
  }

  return integers.reverse();
}

function arrayToString(array) {
  var DIGITS = {
    0: '0',
    1: '1',
    2: '2',
    3: '3',
    4: '4',
    5: '5',
    6: '6',
    7: '7',
    8: '8',
    9: '9'
  }
  var integerString = '';
  var i;

  for (i = 0; i < array.length; i += 1) {
    integerString += DIGITS[array[i]];
  }

  return integerString;
}

function integerToString(integer) {
  var integerAsArray = integerToArray(integer);

  return arrayToString(integerAsArray);
}

// Examples:

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"
