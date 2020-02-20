// Stringy Strings
// Write a function that takes one argument, a positive integer, and returns a string of alternating '1's and '0's, always starting with a '1'. The length of the string should match the given integer.

// Input: A postive integer
// Output: A string of alternating 1s and 0s, always starting with 1
// Rules:
//   Length of string should match input
//   Output string always starts with 1
//    1's follow 0, 0's follow 1's

// Algorithm
// Create a new string '1'
// Loop input times
//   If last char of new string is a 1
//    add a 0 to new string
//   Else
//    Add 1
// Return new string

function stringy(integer) {
  var result = '1';

  while (result.length < integer) {
    if (result[result.length - 1] === '1') {
      result += '0';
    } else {
      result += '1';
    }
  }

  return result;
}

// Examples:

console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"
