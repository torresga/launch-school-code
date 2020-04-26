// Palindromic Number
// Write a function that returns true if its integer argument is palindromic, or false otherwise. A palindromic number reads the same forwards and backwards.

// Input: An integer
// Output: A boolean

// Rules:
// - boolean output depends on whether the number is a palindome (meaning it's the same forwards and backwards)

// Data Structures
// We can convert integer to string to compare the numbers
// We can convert string to array because array has a reverse method

// Algorithm
// 1. Convert integer to string
// 2. Convert string to array
// 3. Reverse array and join to a string
// 4. Return original integer compared to the reversed string converted to a number

function isPalindromicNumber(number) {
  var numberAsString = String(number);

  return number === Number(numberAsString.split('').reverse().join(''));
}

// Examples:

console.log(isPalindromicNumber(34543));        // true
console.log(isPalindromicNumber(123210));       // false
console.log(isPalindromicNumber(22));           // true
console.log(isPalindromicNumber(5));            // true
