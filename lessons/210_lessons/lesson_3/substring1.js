// Substring (1)
// Write a function that returns a substring of a string based on a starting index and length.
//
// Examples
// function substr(string, start, length) {
//   // ...
// }
//
// var string = 'hello world';
//
// substr(string, 2, 4);      // "llo "
// substr(string, -3, 2);     // "rl"
// substr(string, 8, 20);     // "rld"
// substr(string, 0, -20);    // ""
// substr(string, 0, 0);      // ""
// The start argument is the starting index. If negative, treat it as strLength + start where strLength is the length of the string. For example, if start is -3, treat it as strLength - 3.
// The length argument is the maximum length of the desired substring. If length exceeds the number of characters available, just use the available characters.
// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
//
// var a = 'hello';
// a[0];             // "h"
// a[4];             // "o"

// Input: A string, and two integers
// Output: A substring created from that string

// first integer argument represents the starting index. If starting index is negative, treat it as string's length + starting index.
//
// Second integer argument is the length of the substring. If length is greater than available characters, use the available characters.

// Algorithm
// if start < 0, assign to startIndex string.length + start
// if length > string's length - start, use string's length - start as the length, otherwise use length
// if length is less than 0, return an empty string
// Let's loop starting from the starting index
// Stop looping when the substr's length is equal to length
// Add current character to substring
// Return substring

function substr(string, start, length) {
  var startIndex = start;
  var substrLength = length;
  var substring = '';

  if (start < 0) {
    startIndex = string.length + start;
  } else if (length > string.length - start) {
    substrLength = string.length - start;
  } else if (length <= 0) {
    return '';
  }

  do {
    substring += string[startIndex];
    startIndex += 1;
  } while (substring.length < substrLength);

  return substring;
}

var string = 'hello world';

console.log(substr(string, 2, 4));      // "llo "
console.log(substr(string, -3, 2));     // "rl"
console.log(substr(string, 8, 20));     // "rld"
console.log(substr(string, 0, -20));    // ""
console.log(substr(string, 0, 0));      // ""
console.log(substr('hello world', 2, 5));
