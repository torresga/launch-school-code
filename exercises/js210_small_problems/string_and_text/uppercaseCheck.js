// Uppercase Check
// Write a function that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase; false otherwise. Ignore characters that are not alphabetic.

// Input: A string
// Output: A boolean representing whether every alphabetic character inside the string is uppercase

// Rules:
// - ignore characters that are not alphabetic
// - empty string returns true

//
// Data Structure
// Turn string into an array - then can use every? on it

// Algorithm
// 1. Use match to return an array of characters from the string
// 2. Return true if every character in the string is uppercase
//

function isUppercase(string) {
  if (string === '') return true;

  return string.match(/[a-z]/gi).every((char) => char === char.toUpperCase());
}

// Examples:

console.log(isUppercase('t'));               // false
console.log(isUppercase('T'));               // true
console.log(isUppercase('Four Score'));      // false
console.log(isUppercase('FOUR SCORE'));      // true
console.log(isUppercase('4SCORE!'));         // true
console.log(isUppercase(''));                // true
