// Code Review: Rot13 Cipher
// After completing this practice problem, post your solution as a Code Review in this lesson's forums.
//
// Rot13 ("rotate by 13 places") is a letter-substitution cipher that translates a String into a new String:
//
// For each character in the original String:
//
// If the character is a letter in the modern English alphabet, change it to the character 13 positions later in the alphabet. So a becomes n. If you reach the end of the alphabet, return to the beginning. So o becomes b.
// Letter transformations preserve case. A becomes N while a becomes n.
// Don't modify characters that are not letters.
// Write a Function, rot13, that takes a String and returns that String transformed by the rot13 cipher.
//
// console.log(rot13('Teachers open the door, but you must enter by yourself.'));
//
// // logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.
// It's worth noting that rot13 applied twice results in the original string:
//
// console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
//
// // logs:
// Teachers open the door, but you must enter by yourself.
// This happens since there are 26 characters in the modern English alphabet: 2 sets of 13.

// Input: A string
// Output: A string containing each letter rotated by 13 characters.

// Rules:
// -Only letters from a to z and A to Z are transformed. Other characters stay the same.
// - Case is preserved.
// - There are two sets of 13 characters in the alphabet. A becomes N. N becomes A. O becomes B.
//
// Let's use character codes. First we will have to find out what they are:
// 65 to 90 for upcase letters.
// 97 to 122 for downcase letters
//
// We will have to account for the later half of the alphabet. If the character code + 13 > 90 or 122, let's calculate: (code + 13) - 26 and that should give us our number
//
// Algorithm
//
// Create a new string for the transformed string
// Loop through the string
//   Get character code of each character
//   If character code is between 65 to 90
//     If character code + 13 > 90
//       Character code is now (character code + 13) - 26
//     Else
//       Character code is character code + 13
//   Else if between 97 to 122
//     If character code + 13 > 122
//       Character code is now (character code + 13) - 26
//     Else
//       Character code is character code + 13
//   Else
//     Character code stays the same
//
//   Get new character
//   Add transformed character to the new string
//
// Return string

// Refactored version:
// Instead of having nested if statements, I realized that we can use modulo arithmetic to calculate the character code. That arithmetic does change depending on whether the character is uppercase or lowercase.

function rotateChar(charCode, rotate_by, start) {
  var ALPHABET_LEN = 26;

  return (
    ((charCode - start)
      + rotate_by)
      % ALPHABET_LEN)
      + start;
}

function rot13(string) {
  var CHAR_CODE_A_UPPER = 65;
  var CHAR_CODE_Z_UPPER = 90;
  var CHAR_CODE_A_LOWER = 97;
  var CHAR_CODE_Z_LOWER = 122;
  var ROT_BY = 13;

  var transformedString = '';
  var currentCharCode;
  var newCharCode;
  var index;
  for (index = 0; index < string.length; index += 1) {
    currentCharCode = string.charCodeAt(index);

    if (
      currentCharCode >= CHAR_CODE_A_LOWER
      && currentCharCode <= CHAR_CODE_Z_LOWER
    ) {
        newCharCode =
        rotateChar(currentCharCode, ROT_BY, CHAR_CODE_A_LOWER);
    } else if (
      currentCharCode >= CHAR_CODE_A_UPPER
      && currentCharCode <= CHAR_CODE_Z_UPPER
    ) {
        newCharCode =
        rotateChar(currentCharCode, ROT_BY, CHAR_CODE_A_UPPER);
    } else {
      newCharCode = currentCharCode;
    }

    transformedString += String.fromCharCode(newCharCode);
  }

  return transformedString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.'))); // Teachers open the door, but you must enter by yourself.

console.log(rot13(rot13('The quick brown fox jumped over the lazy dog.')));

console.log(rot13('12345 .,<>/? ABC xyz'));
console.log(rot13('M'));
console.log(rot13('abcdefghijklmnopqrstuvwxyz'));
console.log(rot13('ABCDEFGHIJKLMNOPQRSTUVWXYZ'));
console.log(rot13(rot13('Mother Trucker')));
console.log(rot13(rot13('This 12 the b%#@%!* ROT13 decoder ever!!!!'))); //Guvf 12 gur o%#@%!* EBG13 qrpbqre rire!!!!
