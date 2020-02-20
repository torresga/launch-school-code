// Repeating Strings
// Implement a function that takes a string and a number times as arguments. The function should return the string repeated times number of times. If times is not a number, return undefined. If it is a negative number, return undefined also. If times is 0, return an empty string. You may ignore the possibility that times is a number that isn't an integer.
//
// function repeat(string, times) {
//   // ...
// }
//
// repeat('abc', 1);       // "abc"
// repeat('abc', 2);       // "abcabc"
// repeat('abc', -1);      // undefined
// repeat('abc', 0);       // ""
// repeat('abc', 'a');     // undefined
// repeat('abc', false);   // undefined
// repeat('abc', null);    // undefined
// repeat('abc', '  ');    // undefined
// You may concatenate strings, but you may not use any other properties or methods from JavaScript's built-in String class.

// Input: A string and a number of times the string should be repeated
// Output: A new string that contains the first string's value repeated x times.

// Can ignore possibility that number isn't an integer
// We only want integers
//
// Return undefined if times is not a number
// Return undefined if times is a negative number
// Return an empty string if times is 0
//
// Can use string concatenation

// Algorithm
//
// Return undefined if times is not a number
// Return undefined if times is a negative number
// Return an empty string if times is 0
//
// Create new string to hold repeatedString
// Loop times times
//   Concat input string to repeatedString
//
// Return repeated string

function repeat(string, times) {
  if (typeof times != 'number') {
    return undefined;
  } else if (times < 0) {
    return undefined;
  } else if (times === 0) {
    return '';
  }

  var repeatedString = '';
  for (var i = 0; i < times; i++) {
    repeatedString += string;
  }

  return repeatedString;
}

console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  '));    // undefined
