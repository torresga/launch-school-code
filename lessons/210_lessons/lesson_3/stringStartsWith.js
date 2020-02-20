// String StartsWith
// Implement a function that determines whether a string begins with another string. If it does, the function should return true, or false otherwise.
//
// Examples
// function startsWith(string, searchString) {
//   // ...
// }
//
// var str = 'We put comprehension and mastery above all else';
// startsWith(str, 'We');              // true
// startsWith(str, 'We put');          // true
// startsWith(str, '');                // true
// startsWith(str, 'put');             // false
//
// var longerString = 'We put comprehension and mastery above all else!';
// startsWith(str, longerString);      // false
// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
//
// 'hello'[0];    // "h"
// 'hello'[4];    // "o"

// Input: Two strings. First string represents our main string. Second string is the string we are going to search for in our first string
// Output: a boolean

// '' might be a special case - an empty string as a searchString returns true

// Loop through the searchString
//   If current character of searchString does not equal current character of first string
//     Return false
// Return true

function startsWith(string, searchString) {
  for (var i = 0; i < searchString.length; i++) {
    if (searchString[i] !== string[i]) {
      return false;
    }
  }

  return true;
}

var str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We'));              // true
console.log(startsWith(str, 'We put'));          // true
console.log(startsWith(str, ''));                // true
console.log(startsWith(str, 'put'));             // false
console.log(startsWith(str, 'We com'));          // false
console.log(startsWith(str, 'We put comprehension and mastery above all else!')) // false
