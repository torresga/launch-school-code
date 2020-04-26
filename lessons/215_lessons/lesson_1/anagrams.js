// Practice Problem: Anagrams
// Write a Function named anagram that takes two arguments: a word and an array of words. Your function should return an array that contains all the words from the array argument that are anagrams of the word argument. For example, given the word "listen" and an array of candidate words like "enlist", "google", "inlets", and "banana", the program should return an array that contains "enlist" and "inlets".

// Input: a word and an array of words
// Output: a new array that contains the words that are anagrams of word
//
// How do we tell if a word is an anagram? We can split the word into an array, sort the array, and join the letters together.
//
// Algorithm
// 1. Sort the letters in word
// 2. Filter the array: select the words that, when sorted, equal the word

// Examples
function sortLetters(word) {
  return word.split('').sort().join('');
}

function anagram(word, list) {
  let sortedWord = sortLetters(word);

  return list.filter((currentWord) => sortLetters(currentWord) === sortedWord);
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
