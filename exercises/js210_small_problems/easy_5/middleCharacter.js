// Get the Middle Character
// Write a function that takes a non-empty string argument, and returns the middle character(s) of the string. If the string has an odd length, you should return exactly one character. If the string has an even length, you should return exactly two characters.

// Input: A string
// Output: A string

// Input string is non empty
// Return the middle character - if string is odd length, return exactly one character
// If string is even length, return two characters

// Data Structure
// string

// Algorithm
// If string's length is odd,
//    Divide string length by 2 and round down
//    Return the character at that index
// Else
      // Divide string length by 2 and round down
      // Return character at that index, and next character

// function centerOf(str) {
//   var middle = Math.floor(str.length / 2);

//   if (str.length % 2 === 1) {
//     console.log(str.slice(middle, middle + 1));
//   } else {
//     console.log(str.slice(middle - 1, middle + 1));
//   }
// }

// // Examples:

// centerOf('I Love JavaScript'); // "a"
// centerOf('Launch School');     // " "
// centerOf('Launch');            // "un"
// centerOf('Launchschool');      // "hs"
// centerOf('x');                 // "x"
