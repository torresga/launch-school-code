// Trimming Spaces
// Write a function that takes a string as an argument, and returns the string stripped of spaces from both ends. Do not remove or alter internal spaces.
//
// Example
// trim('  abc  ');  // "abc"
// trim('abc   ');   // "abc"
// trim(' ab c');    // "ab c"
// trim(' a b  c');  // "a b  c"
// trim('      ');   // ""
// trim('');         // ""
// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
//
// 'hello'[0];       // "h"
// 'hello'[4];       // "o"

// Input: A string
// Output: A string with space removed from the beginning and the end of it. Spaces in between are kept.

// In other words, each string has to begin with a letter and end with a letter. - or it is an empty string

// Definitely need to loop through the string
// Create a new string, and use concatenation to build up the new string
//
// Create a new string for the new Output
// Inside the loop, create a new string, and break out of the loop when there's a new character

// Count spaces from the first character up until the first letter character
//   Loop from 0 to string length
//     If current character === ' '
//       add 1 to counter
//       continue
//     else
//       break
// Return count
//
// Count spaces from the last character up until the last letter character
//   Loop from string length down to 0
//     If current character === ' '
//       subtract 1 from counter
//       countinue
//     else
//       break
// Return count
//
// Loop through the string from the first letter character
//   Get every letter from first character to the last letter character
//
// Return new string

function trim(input) {
  var beginningSpaces = 0;
  var endingSpaces = input.length;
  var trimmedString = '';

  for (var i = 0; i < input.length; i++) {
    if (input[i] === ' ') {
      beginningSpaces += 1;
    } else {
      break;
    }
  }

  for (var i = input.length - 1; i >= 0; i--) {
    if (input[i] === ' ') {
      endingSpaces -= 1;
    } else {
      break;
    }
  }

  for (var i = beginningSpaces; i < endingSpaces; i++) {
    trimmedString += input[i];
  }

  console.log(trimmedString);
}

trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
trim(' ab c');    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""
