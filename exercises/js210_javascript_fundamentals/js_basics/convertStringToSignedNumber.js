// Convert a String to a Signed Number
// The previous exercise mimics the parseInt function to a lesser extent. In this exercise, you're going to extend that function to work with signed numbers.
//
// Write a function that takes a string of digits, and returns the appropriate number as an integer. The string may have a leading + or - sign; if the first character is a +, your function should return a positive number; if it is a -, your function should return a negative number. If there is no sign, return a positive number.
//
// You may assume the string will always contain a valid number.

// Input: A string of digits
// Output: A number as an integer
//
// If the number has a + or no sign, return a positive number
// If the number has a - sign, return a negative number
//

// Algorithm
// Take off sign if sign exists
//  Create variable for sign
//  Assign first element of number to sign if first element is - or +
//  Remove sign if first element is - or +

// Convert string to integers
// Convert string to array, convert array to integer

// Create new array
// Loop through string,
//  Convert current element to integer
//  Add integer to new array

// Create new variable to hold integer and assign it to 0
// Loop through array
//   Assign it to integer 10 * current value of integer + current element of the array

// Look at sign of original string
//  If sign is -, multiply number by -1
// Else
    // return original number

function stringToIntegerArray(str) {
  var DIGITS = {
    '0': 0,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9
  }

  var integerArray = [];
  var i;

  for (i = 0; i < str.length; i += 1) {
    integerArray.push(DIGITS[str[i]]);
  }

  return integerArray;
}

function integerArrayToInt(array) {
  var int = 0;
  var i;

  for (i = 0; i < array.length; i += 1) {
    int = 10 * int + array[i];
  }

  return int;
}

function stringToSignedInteger(numberAsString) {
  var sign;
  var numberAsInt;

  if (numberAsString[0] === '-' || numberAsString[0] === '+') {
    sign = numberAsString[0];
    numberAsString = numberAsString.slice(1);
  }

  numberAsInt = integerArrayToInt(stringToIntegerArray(numberAsString));

  if (sign === '-') {
    return numberAsInt * -1;
  }

  return numberAsInt;
}
// Examples:

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100
