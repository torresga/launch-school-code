// Capitalize Words
// Write a function that takes a string as an argument, and returns that string with the first character of every word capitalized and all subsequent characters in lowercase.

// Input: A string
// Output: A transformed string
//
// Rules:
// - every word is capitalized
// - all characters in the rest of the word are lowercase
// - a word is any sequence of non-whitespace characters
// - quoted words stay the same (or any words that are surrounded with any sort of punctuation)
//
// Transformation problem
//
// Data Structure
// Split string into an array - that way we can capitalize the word

// Algorithm
// 1. Split word into an array
// 2. Transform each word in array:
//   - Capitalize first letter
//   - Slice rest of word (downcased)
//   - Add first letter + rest of word
// 3. Join array with spaces

//
// You may assume that a word is any sequence of non-whitespace characters.

//

function wordCap(string) {
  return string.split(' ')
               .map((word) => word[0].toUpperCase() + word.slice(1).toLowerCase())
               .join(' ');
}

// Examples:

console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'
