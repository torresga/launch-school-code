// How Long Are You
// Write a function that takes a string as an argument, and returns an array that contains every word from the string, with each word followed by a space and the word's length. If the argument is an empty string or if no argument is passed, the function should return an empty array.
//
// You may assume that every pair of words in the string will be separated by a single space.

// Input: A string
// Output: An array containing every word from the string, with each word followed by a space and the word's length.
//
// Rules:
// - Return an empty array if input is missing or is an empty string
// - Can assume that every word in the string will be separated by a single space
//
// Transformation problem
//
// Data Structures
// String -> array
//
// Algorithm
// 1. Split string into an array of words
// 2. Map words
//   Transform each word to be word + word.length
// 3. Return words

function wordLengths(string) {
  if (arguments.length === 0 || string.length === 0) return [];

  let words = string.split(' ');

  return words.map(function(word) {
    return `${word} ${word.length}`;
  });
}

//
// Examples:

console.log(wordLengths('cow sheep chicken')); // ["cow 3", "sheep 5", "chicken 7"]);

console.log(wordLengths('baseball hot dogs and apple pie')); //["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]);

console.log(wordLengths("It ain't easy, is it?"));
// ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

console.log(wordLengths('Supercalifragilisticexpialidocious'));
// ["Supercalifragilisticexpialidocious 34"]

console.log(wordLengths(''));      // []
console.log(wordLengths());        // []
