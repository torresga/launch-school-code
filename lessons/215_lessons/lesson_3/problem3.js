// Problem Description
// A collection of spelling blocks has two letters per block, as shown in this list:

// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M
// This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

// Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

// Input: A string representing a word. Case can be either uppercase or lowercase. (Ex: 'jESt')
// - Only dealing with single words
// - Pontential edge cases: characters that do not appear as letters on the blocks

// Output: A boolean, representing whether the word can be created with the letters on the blocks.

// Rules:
// - Can only spell words containing letters that do not use both letters from any given block
// - Can only use block once, so any word that has duplicate letters are invalid (Ex. 'call' - invalid because it uses the same letter 'l' twice)

// Mental model:
// Given a case insensitive word and a series of blocks (containing two different letters), determine whether the word can be made by the blocks. If the word can be made by the blocks, return true. Else, return false.

// Examples:

// isBlockWord('BATCH');      // true - letters are on different blocks
// B:O
// A:N
// T:G
// C:P
// H:U

// isBlockWord('BUTCH');      // false - U and H are on the same block
// B:O
// U:H
// T:G
// C:P
// Can't use H again, therefore this word is false because it cannot be made with the blocks

// isBlockWord('jest');       // true - uses unique blocks, letters are on different blocks
// J:W
// E:R
// S:F
// T:G

// isBlockWord('call'); // false - uses duplicate letters
// isBlockWord('jEsT'); // true - case insensitive

// Potential edge cases:
// - What do we do about empty strings?
// - What do we do about words that contain characters that are not on either side of any of the blocks?

// Shape of problem - testing every character in word due to specific criteria

// Problem comes down to figuring out what data structure to use for the blocks?

// Potential approaches:
// Can use array method every to determine whether each character in the word satisfies the condition

// Data structure can be either hash or two arrays - either key value pairs like above:
// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M

// Two arrays:
// ['B', 'G', 'V', 'X'...]
// ['O', 'T', "I", 'K' ... ]
// Array cannot have characters that appear in both arrays
// Array can have characters in either array, but not both

// - Have to determine whether each character in the array is not in both arrays
// - Have to determine whether any character in the array is used more than once

// Data Structure
// For input - we can split string into an array of characters to use every
// For blocks, we can use two arrays representing each side of the block.

// Algorithm
// 1. Create two arrays, one for each side of the block
// 2. Upcase characters
// 3. Split input string into an array of characters
// 3. Loop through the array
//   - Return false if current character is used more than once
// 4. Loop through the indexes of both arrays
//   - Retrurn false if the characters include characters from both array with the same index
// 5. Return true

// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M


function isBlockWord(word) {
  const side1 = ['B', 'G', 'V', 'X', 'R', 'L', 'D', 'F', 'Z', 'C', 'J', 'N', 'H'];
  const side2 = ['O', 'T', 'I', 'K', 'E', 'Y', 'Q', 'S', 'M', 'P', 'W', 'A', 'U'];
  let chars = word.toUpperCase().split('');

  if (chars.every(function(char){
    return chars.indexOf(char) === chars.lastIndexOf(char)
  }) === false) {
    return false;
  }

  for (let i = 0; i < side1.length; i += 1) {
    if (chars.includes(side1[i]) && chars.includes(side2[i])) {
      return false;
    }
  }

  return true;
}

console.log(isBlockWord('BATCH'));      // true - letters are on different blocks
console.log(isBlockWord('BUTCH'));      // false - U and H are on the same block
console.log(isBlockWord('jest'));       // true - uses unique blocks, letters are on different blocks
console.log(isBlockWord('call')); // false - uses duplicate letters
console.log(isBlockWord('jEsT')); // true - case insensitive

// JEST

// J
// E
// S
// T
// ['J', 'E', 'S', 'T'] include B and O? false
// ['J', 'E', 'S', 'T'] include G and T? false
// ['J', 'E', 'S', 'T'] include V and I? false
// ['J', 'E', 'S', 'T'] include X and K? false
// ['J', 'E', 'S', 'T'] include R and E? false
// ['J', 'E', 'S', 'T'] include L and Y? false
// ['J', 'E', 'S', 'T'] include D and Q? false
// ['J', 'E', 'S', 'T'] include F and S? false
// ['J', 'E', 'S', 'T'] include Z and M? false
// ['J', 'E', 'S', 'T'] include C and P? false
// ['J', 'E', 'S', 'T'] include J and W? false
// ['J', 'E', 'S', 'T'] include N and A? false
// ['J', 'E', 'S', 'T'] include H and U? false
// true

// BUTCH
// ['B', 'U', 'T', 'C', 'H']
// ['B', 'U', 'T', 'C', 'H'] include B and O? false
// ['B', 'U', 'T', 'C', 'H'] include G and T? false
// ['B', 'U', 'T', 'C', 'H'] include V and I? false
// ['B', 'U', 'T', 'C', 'H'] include X and K? false
// ['B', 'U', 'T', 'C', 'H'] include R and E? false
// ['B', 'U', 'T', 'C', 'H'] include L and Y? false
// ['B', 'U', 'T', 'C', 'H'] include D and Q? false
// ['B', 'U', 'T', 'C', 'H'] ----
// ['B', 'U', 'T', 'C', 'H'] include H and U? true
// false
