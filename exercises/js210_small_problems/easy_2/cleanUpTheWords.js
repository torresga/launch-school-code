// Clean Up the Words
// Given a string that consists of some words and an assortment of non-alphabetic characters, write a function that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (i.e., the result string should never have consecutive spaces).

// Input: A string
// Output: a new string

// Rules
// - Replace non-alphabetic characters with spaces
// - If more than one non-alphabetic character occurs in a row, there should be only one space to replace it.

// Algorithm
// Create a new string = cleanedUpString
// Loop through the old string
//  If current character is non alphabetic
//    If last character in new string is a space
//      Add nothing
//    Else
//    Add a space to new string
//  Else
//    Add current character to new string

function cleanUp(str) {
  var cleanedUpStr = '';

  var i;
  for (i = 0; i < str.length; i += 1) {
    if (str[i].match(/[^a-z]/i)) {
      if (cleanedUpStr[cleanedUpStr.length - 1] === ' ') {
        continue;
      } else {
        cleanedUpStr += ' ';
      }
    } else {
      cleanedUpStr += str[i];
    }
  }

  return cleanedUpStr;
}

// Example:

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "
