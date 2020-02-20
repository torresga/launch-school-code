// Index of Substring
// Write two functions that each take two strings as arguments. Their expected behaviors are as follows:
//
// The indexOf function searches for the first instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.
//
// The lastIndexOf function searches for the last instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.
//
// Both functions return -1 if firstString does not contain the substring specified by secondString.
//
// Examples
// function indexOf(firstString, secondString) {
//   // statements
// }
//
// function lastIndexOf(firstString, secondString) {
//   // statements
// }
//
// indexOf('Some strings', 's');                      // 5
// indexOf('Blue Whale', 'Whale');                    // 5
// indexOf('Blue Whale', 'Blute');                    // -1
// indexOf('Blue Whale', 'leB');                      // -1
//
// lastIndexOf('Some strings', 's');                  // 11
// lastIndexOf('Blue Whale, Killer Whale', 'Whale');  // 19
// lastIndexOf('Blue Whale, Killer Whale', 'all');    // -1
// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
//
// 'hello'[0];    // "h"
// 'hello'[4];    // "o"


// indexOf:
//   Input: two strings, second string represents substring we are looking for in the first string
//   Output: The index of the first character of the first instance of that substring
//
// lastIndexOf:
//   Input: two strings, second string represents substring we are looking for in the first string
//   Output: The index of the first character of the last instance of that substring

// Rules for both:
// - may not use any String properties or methods other than square brackets and length property.
// - Looks like each string is case sensitive, 's' != 'S'
// - Both functions return -1 if firstString doesn't contain the substring specified by secondString

// Maybe we can write one and then use that in the other one?

// indexOf('Some strings', 's');                      // 5
//
// Loop through 'Some strings'
// 'S' != 's'
// 'o' != 's'
// 'm' != 's'
// 'e' != 's'
// ' ' != 's'
// 's' == 's' // this means positionOfSubstring is first index of 'Some strings'['s'], which is 5
// We can stop there because the substring 's' has only one character, and return 5
//
// indexOf('Blue Whale', 'Whale');                    // 5
//
// Loop through 'Blue Whale'
// 'B' != 'W'
// 'l' != 'W'
// 'u' != 'W'
// 'e' != 'W'
// ' ' != 'W'
// 'W' == 'W' // we can set positionOfSubstring to 5, the first index of W in 'Blue Whale'
// 'h' == 'h'
// 'a' == 'a'
// 'l' == 'l'
// 'e' == 'e'
// We can stop there because we finished looping theough the substring, and return 5
//
// indexOf('Blue Whale', 'Blute');                    // -1
//
// Loop through 'Blue Whale'
// 'B' == 'B' // positionOfSubstring is 0, 'B''s index is 0
// 'l' == 'l'
// 'u' == 'u'
// 'e' != 't' // The two characters are not equal, time to stop looping and return -1
//
// indexOf('Blue Whale', 'leB');                      // -1
//
// Loop through 'Blue Whale'
// 'B' != 'l'
// 'l' == 'l' // positionOfSubstring is 1
// 'u' != 'e' // The two characters are not equal, stop looping and return -1
//
// What does this mean?
// 1. We loop each character in firstString until we hit the first character of subString
// 2. We remember the position of subString's first character in firstString
// 3. We go to the next character in subString
// 4. If the next character in subString is not the same character as the next character in firstString
// 5.    If they are not the same character because the substring ran out of letters
//         Then we stop the loop and return the positionOfSubstring
// 6.    Else We stop looping and return -1
// 6. Otherwise we keep looping
// 7. At the end of the loop, return the positionOfSubstring

function indexOf(firstString, subString) {
  var indexOfFirstString = 0;
  var indexOfSubstring = 0;
  var positionOfSubstring = 0;

  while (indexOfFirstString < firstString.length) {
    if (firstString[indexOfFirstString] === subString[indexOfSubstring]) {
      if (indexOfSubstring === 0) {
        positionOfSubstring = indexOfFirstString;
      }

      indexOfSubstring += 1

      if (firstString[indexOfFirstString + 1] != subString[indexOfSubstring]) {
        if (subString[indexOfSubstring] === undefined) {
          break;
        } else {
          positionOfSubstring = -1;
          break;
        }
      }
    }

    indexOfFirstString += 1;
  }

  console.log(positionOfSubstring);
}

indexOf('Some strings', 's');                      // 5
indexOf('Blue Whale', 'Whale');                    // 5
indexOf('Blue Whale', 'Blute');                    // -1
indexOf('Blue Whale', 'leB');                      // -1
indexOf('Blue Whale', 'all');


// lastIndexOf('Some strings', 's');                  // 11
// Loop through 'Some strings'
// 'S' != 's'
// 'o' != 's'
// 'm' != 's'
// 'e' != 's'
// ' ' != 's'
// 's' == 's' // positionOfSubstring = 5
// 't' != 's'
// 'r' != 's'
// 'i' != 's'
// 'n' != 's'
// 'g' != 's'
// 's' == 's' // positionOfSubstring = 11
// End of firstString and lastString, so we can return positionOfSubstring
//
// lastIndexOf('Blue Whale, Killer Whale', 'Whale');  // 19
// Loop through 'Blue Whale, Killer Whale'
// 'B' != 'W'
// 'l' != 'W'
// 'u' != 'W'
// 'e' != 'W'
// ' ' != 'W'
// 'W' == 'W' // positionOfSubstring = 5
// 'h' == 'h'
// 'a' == 'a'
// 'l' == 'l'
// 'e' == 'e'
// We went through all the letters in substring, so we start going through them again
// ',' != 'W'
// ' ' != 'W'
// 'K' != 'W'
// 'i' != 'W'
// 'l' != 'W'
// 'l' != 'W'
// 'e' != 'W'
// 'r' != 'W'
// ' ' != 'W'
// 'W' == 'W' // positionOfSubstring = 19
// 'h' == 'h'
// 'a' == 'a'
// 'l' == 'l'
// 'e' == 'e'
// We went through both strings, so we can return positionOfSubstring

// I think the difference between these two is that for the lastIndexOf, we go through the string the whole way through, we don't break.

// 1. We loop each character in firstString until we hit the first character of subString
// 2. We remember the position of subString's first character in firstString
// 3. We go to the next character in subString
// 4. If the next character in subString is not the same character as the next character in firstString
// 5.    If they are not the same character because the substring ran out of letters
//         Then we stop the loop and return the positionOfSubstring
// 6.    Else We stop looping and return -1
// 6. Otherwise we keep looping
// 7. At the end of the loop, return the positionOfSubstring

// Algorithm:
// 1. We can set positionOfSubstring initially to be -1. That way if we don't change positionOfSubstring, its default will be -1
// 2. Loop through firstString
// 3.  If current character of firstString matches current character of subString
// 4.    Change positionOfSubstring to current position of current character in firstString
// 5.  Add 1 to indexOfSubstring
// 6.  If indexOfSubstring > subString.length
// 7.      Assign index0fSubstring to 0
// 8. At the end of the loop, return the positionOfSubstring

function lastIndexOf(firstString, subString) {
  var indexOfFirstString = 0;
  var indexOfSubstring = 0;
  var positionOfSubstring = -1;

  while (indexOfFirstString < firstString.length) {
    if (firstString[indexOfFirstString] === subString[indexOfSubstring]) {
      if (indexOfSubstring === 0) {
        positionOfSubstring = indexOfFirstString;
      }

      indexOfSubstring += 1

      if (firstString[indexOfFirstString + 1] != subString[indexOfSubstring]) {
        if (subString[indexOfSubstring] === undefined) {
          index0fSubstring = 0;
          break;
        }
        // } else {
        //   positionOfSubstring = -1;
        //   break;
        // }
      }
    }

    indexOfFirstString += 1;
  }

  console.log(positionOfSubstring);
}

lastIndexOf('Some strings', 's');                  // 11
lastIndexOf('Blue Whale, Killer Whale', 'Whale');  // 19
lastIndexOf('Blue Whale, Killer Whale', 'all');    // -1
