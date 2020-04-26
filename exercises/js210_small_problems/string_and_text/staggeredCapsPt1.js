// Staggered Caps Part 1
// Write a function that takes a string as an argument, and returns that string with a staggered capitalization scheme. Every other character, starting from the first, should be capitalized and should be followed by a lowercase or non-alphabetic character. Non-alphabetic characters should not be changed, but should be counted as characters for determining when to switch between upper and lower case.

// Input: A string
// Output: A string

// Rules:
// - Every other character should be capitalized
// - non alphabetic characters are not changed, but should be counted as characters for determining when to switch between upper and lower case

// This is still a transformation problem, but we need to keep track of whether we need to capitalize the character

// Data Structures
// String -> array -> string

// Algorithm
// 0. Create a variable to keep track of whether character should be capitalized and assign it to true
// 1. Downcase all characters in string
// 2. Split string into characters
// 3. Map characters:
//   If variable is true
//     Return upcased character
//   Else
//     Return character
//
//   Assign to variable its' opposite value
//
// 4. Join characters
// 5. Return characters

function staggeredCase(str) {
  let isCapitalized = true;

  return str.toLowerCase().split('').map(function(char) {
    let newChar = '';

    if (isCapitalized) {
      newChar = char.toUpperCase();
    } else {
      newChar = char;
    }

    isCapitalized = !isCapitalized;
    return newChar;
  }).join('');
}
//
// Examples:

console.log(staggeredCase('I Love Launch School!') === "I LoVe lAuNcH ScHoOl!");
console.log(staggeredCase('ALL_CAPS') === "AlL_CaPs");
console.log(staggeredCase('ignore 77 the 444 numbers') === "IgNoRe 77 ThE 444 NuMbErS");
