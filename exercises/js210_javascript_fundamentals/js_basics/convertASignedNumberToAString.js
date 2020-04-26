// Convert a Signed Number to a String
// In the previous exercise, you reimplemented a function that converts non-negative numbers to strings. In this exercise, you're going to extend that function by adding the ability to represent negative numbers.
//
// You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. You may, however, use the integerToString function from the previous exercise.
//
// Examples:

// signedIntegerToString(4321);      // "+4321"
// signedIntegerToString(-123);      // "-123"
// signedIntegerToString(0);         // "0"

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

// Algorithm
// If number is zero
//  Return zero
// If number is negative (number < 0)
//  Return "-" + integerToString(number * -1)
// Else
//  return "+" + integerToString(number)

function signedIntegerToString(number) {
  if (number === 0) {
    return integerToString(number);
  } else if (number < 0) {
    return '-' + integerToString(number * -1);
  } else {
    return '+' + integerToString(number);
  }
}

// Examples:

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"
