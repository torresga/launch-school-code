// Palindromic Strings Part 1
// Write a function that returns true if the string passed as an argument is a palindrome, or false otherwise. A palindrome reads the same forwards and backwards. For this problem, the case matters and all characters matter.

// Input: A string
// Output: Boolean representing whether the input is the same forwards and backwards
//
// Data Structures
// we can convert string to an array to reverse it, and the back to a string to compare
//
// Algorithm
// 1. Convert string into an array
// 2. Reverse array
// 3. Join array back into a string
// 4. return whether input string equals reversed array

// Code
function isPalindrome(input) {
  return input === input.split('').reverse().join('');
}

// Examples:

console.log(isPalindrome('madam'));               // true
console.log(isPalindrome('Madam'));               // false (case matters)
console.log(isPalindrome("madam i'm adam"));      // false (all characters matter)
console.log(isPalindrome('356653'));              // true
