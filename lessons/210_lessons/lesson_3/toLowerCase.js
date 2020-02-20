// Converting Strings to Lower Case
// Write a function that returns a string converted to lowercase.
//
// To convert a single uppercase character to a lowercase character, get its ASCII numeric representation from the ASCII table, add 32 to that number, then convert the number back to a character using the same ASCII table. You can use the String.fromCharCode and the String.charCodeAt methods for these operations. For example:
//
// var string = 'A';
// asciiNumeric = string.charCodeAt(0);         // 65
// asciiNumeric += 32;
// string = String.fromCharCode(asciiNumeric);  // "a", converted to lowercase
// Examples
// function toLowerCase(string) {
//   // ...
// }
//
// toLowerCase('ALPHABET');    // "alphabet"
// toLowerCase('123');         // "123"
// toLowerCase('abcDEF');      // "abcdef"
// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
//
// 'hello'[0];    // "h"
// 'hello'[4];    // "o"

// Input: A string
// Output: A lowercase string
// Our string has the potential to have non-alphabetic characters or letters that are already lowercase. So we need to ignore those characters and only lowercase the ones that are uppercase.

// A is 65
// Z is 90
// is it safe to assume that B to Y are continuous? If so, we can get the charCode for each letter, ignore the character if the charCode is greater than 90 or less than 65.

// Algorithm
// Create new string to hold lowercaseString
// Loop through string
//   if current character's character code is greater than or equal to 65 and less than or equal to 90
//    Add 32 to the character code
//    Get new character
// Add character to string
// Return lowercaseString

function toLowerCase(input) {
  var lowercaseString = '';
  var CONVERSION_OFFSET = 32;
  var currentChar;

  for (var i = 0; i < input.length; i++) {
    currentChar = input[i];
    currentCharCode = currentChar.charCodeAt(0);

    if (currentCharCode >= 65 && currentCharCode <= 90) {
      currentCharCode += CONVERSION_OFFSET;
      currentChar = String.fromCharCode(currentCharCode);
    }

    lowercaseString += currentChar;
  }

  return lowercaseString;
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"
