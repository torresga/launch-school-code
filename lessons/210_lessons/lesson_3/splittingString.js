// Splitting a String
// Write a function that takes two arguments:
//
// a string to be split
// a delimiter character
// The function logs the split strings to the console, as shown below:
//
// Examples
// function splitString(string, delimiter) {
//   // ...
// }
//
// splitString('abc,123,hello world', ',');
// // logs:
// // abc
// // 123
// // hello world
//
// splitString('hello');
// // logs:
// // ERROR: No delimiter
//
// splitString('hello', '');
// // logs:
// // h
// // e
// // l
// // l
// // o
//
// splitString('hello', ';');
// // logs:
// // hello
//
// splitString(';hello;', ';');
// // logs:
// //  (this is a blank line)
// // hello
// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
//
// 'hello'[0];    // "h"
// 'hello'[4];    // "o"

// Input: Two strings. First represents string to be split, second one is delimiter.
// Output: an array? or maybe a string with \n in place of the delimiter

// Output Error: No delimiter if delimiter is empty
// Create a new string instead of mutating input
// Loop through each character of the string
//   If current character is the delimeter,
//     Concatenate '\n' to new string
//   Else
//     Concatenate current character to string
//
// Output new string

function splitString(str, delimiter) {
  if (delimiter === undefined) {
    console.log('ERROR: No delimiter');
    return;
  }

  var newSplitString = '';

  for (var i = 0; i < str.length; i++) {
    if (str[i] === delimiter) {
      newSplitString += '\n';
    } else if (delimiter === '') {
      newSplitString += str[i] + '\n';
    } else {
      newSplitString += str[i];
    }
  }

  console.log(newSplitString);
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello
