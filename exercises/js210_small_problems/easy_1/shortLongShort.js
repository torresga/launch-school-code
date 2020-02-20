// Short Long Short
// Write a function that takes two strings as arguments, determines the longer of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.
//

// Input: Two strings
// Output: Shorter string + longer string + shorter string

// Create variable shorter
// Create variable longer
// If first string is shorter
//  Assign first string to shorter
//  Assign second string to longer
// Else
//  Assign first string to longer
//  Assign second string to shorter
// Log to console shorter + longer + shorter

function shortLongShort(first, second) {
  var shorter;
  var longer;

  if (first.length < second.length) {
    shorter = first;
    longer = second;
  } else {
    shorter = second;
    longer = first;
  }

  console.log(shorter + longer + shorter);
}



// Examples:

shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"
