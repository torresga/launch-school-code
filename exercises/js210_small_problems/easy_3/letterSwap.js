// Letter Swap
// Given a string of words separated by spaces, write a function that swaps the first and last letters of every word.
//
// You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces, and that there are no leading, trailing, or repeated spaces.
//
// Examples:

// Input: A string
// Output: A string
//
// Rules:
// - Input string will contain at least one word
// - each string contains nothing but words and spaces, and there are no leading, trailing, or repeated spaces
// - each word in the string has the first and last letters swapped
// - what about if there's one letter? let's return it as is

// Data Structures
// Split string into an array of words.
// Create a new array to hold the rearranged words
// For each word, we can create a new string - last character + middle + first char

// Algorithm
// Return string if string's length is 1
// Create a new array to hold the rearranged words
// Split string into an array of words
// Loop through array of words
//  Create new word
//  If current word is longer than one character
//    Get first character
//    Get last character
//    Get middle
//    Assign word to last character + middle + first character
//  Else assign word to first character
//  Add word to rearranged words array
// Return rearranged words array joined into a string by a space

function swap(string) {
  var rearrangedWords = [];
  var originalWords = string.split(' ');
  var i;
  var newWord;
  var firstChar;
  var lastChar;
  var middle;

  if (string.length === 1) {
    return string;
  }

  for (i = 0; i < originalWords.length; i += 1) {
    if (originalWords[i].length > 1) {
      firstChar = originalWords[i][0];
      lastChar = originalWords[i][originalWords[i].length - 1];
      middle = originalWords[i].slice(1, originalWords[i].length - 1);
      newWord = lastChar + middle + firstChar;
    } else {
      firstChar = originalWords[i][0];
      newWord = firstChar;
    }

    rearrangedWords.push(newWord);
  }

  return rearrangedWords.join(' ');
}


console.log(swap('Oh what a wonderful day it is') === "hO thaw a londerfuw yad ti si");
console.log(swap('Abcde') === "ebcdA");
console.log(swap('a') === "a");
