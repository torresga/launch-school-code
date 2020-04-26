// Staggered Caps Part 2
// Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

// Input: A string
// Output: A string
//
// Rules:
// - ignores non-alphabetic characters when determining a letter should be upper or lowercase
// - non alphabetic characters should still remain in the string
//
// Data Structures:
// string -> array - String
//
// Algorithm:
// 1. Create a variable to keep track of whether it's capitalized and assign it to true
// 2. downcase string
// 3. Split string into characters
// 4. Map string
// 5.   if variable is true
// 6.     Upcase current character
// 7.   else
//8.       Return current character
// 9.   Assign variable to opposite
// 10. Assign variable to opposite again if character is non alphabetic
// 9. Join string
// 10. Return string

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

    if (/[^a-z]/i.test(char)) {
      isCapitalized = !isCapitalized;
    }

    return newChar;
  }).join('');
}
// Examples:

console.log(staggeredCase('I Love Launch School!') === "I lOvE lAuNcH sChOoL!");
console.log(staggeredCase('ALL CAPS') === "AlL cApS");
console.log(staggeredCase('ignore 77 the 444 numbers') === "IgNoRe 77 ThE 444 nUmBeRs");
