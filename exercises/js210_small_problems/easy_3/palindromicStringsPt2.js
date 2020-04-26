// Palindromic Strings Part 2
// Write another function that returns true if the string passed as an argument is a palindrome, or false otherwise. This time, however, your function should be case-insensitive, and should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the isPalindrome function you wrote in the previous exercise.

// Input: A string
// Output: A boolean representing whether the string is a palindrome (without taking into account case and non-alphanumeric characters)
//
// Data Structures
// strings
//
// Algorithm
// 1. Create new string
// 2. Assign to new string the string downcased with all non-alphanumeric characters removed
// 3. compare with isPalindrome

function isRealPalindrome(str) {
  var nonAlphanumericRemoved = str.replace(/\W\D*/i, '');

  return isPalindrome(nonAlphanumericRemoved.toLowerCase());
}

// Examples:

console.log(isRealPalindrome('madam'));               // true
console.log(isRealPalindrome('Madam'));               // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam"));     // true (only alphanumerics matter)
console.log(isRealPalindrome('356653'));              // true
console.log(isRealPalindrome('356a653'));             // true
console.log(isRealPalindrome('123ab321'));            // false

// Code
function isPalindrome(input) {
  return input === input.split('').reverse().join('');
}
