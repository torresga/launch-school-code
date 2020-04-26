// Swap Case
// Write a function that takes a string as an argument, and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.
//
// Input: A string
// Output: A string
//
// Rules
// - lowercase characters become uppercase
// - uppercase characters become lowercase
// - all other characters are unchanged
//
// Transformation problem
//
// Data Structures
// turn string into an array to transform each character
//
// Algorithm
// 0. Split string into an array
// 1. Loop through array
// 2.   Uppercase character if character is currently lowercase
// 3.   Lowercase character if character is currently uppercase
// 4.   Return character if character is not alphabetic
// 5. Join array into a string
// 6. Return string

// Code
function swapCase(str) {
  return str.split('')
            .map(function (char) {
              if (/[a-z]/.test(char)) {
                return char.toUpperCase();
              } else if (/[A-Z]/.test(char)) {
                return char.toLowerCase();
              } else {
                return char;
              }
            })
            .join('');
}
// Examples:

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"
