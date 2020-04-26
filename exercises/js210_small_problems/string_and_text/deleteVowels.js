// Delete Vowels
// Write a function that takes an array of strings, and returns an array of the same strings values without the vowels (a, e, i, o, u).

// Input: An array of strings
// Output: An array of strings without the vowels

// Rules:
// - output a new array
// - output array contains same strings as the input, but without the vowels

// transformation - return an array with the same number of elements

// - remember that for the regex, that it has to account for both cases

// Data Structure:

// an array for both input an output

// Algorithm
// 1. Loop through the array using map
// 2.   Replace vowels in the string with ''
// 3. Return the transformed array

// Code

function removeVowels(array) {
  return array.map((string) => string.replace(/[aeiou]/gi, ''));
}


// Examples:

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));         // ["bcdfghjklmnpqrstvwxyz"]
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));  // ["grn", "YLLW", "blck", "wht"]
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                // ["BC", "", "XYZ"]
