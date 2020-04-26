// Palindromic Substrings
// Write a function that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as backwards. The substrings in the returned list should be sorted by their order of appearance in the input string. Duplicate substrings should be included multiple times.
//
// You may (and should) use the substrings function you wrote in the previous exercise.
//
// For the purpose of this exercise, you should consider all characters and pay attention to case; that is, 'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not. In addition, assume that single characters are not palindromes.

// Input: A string
// Output: An array where each element is a palindrome

// Rules:
// - keep case
// - single characters are not a palindrome
//
// Data Structure
// to check whether current element is a substring, we can split string into an array
//
// Algorithm
//
// 1. Get a list of substrings with substrings.
// 2. Filter through the list of substrings
//   Current element is a substring if backwards === forwards and substring's length > 1


// Examples:

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]
//
console.log(palindromes('hello-madam-did-madam-goodbye'));
// // returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]
//
console.log(palindromes('knitting cassettes'));
// // returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]

function palindromes(str) {
  let allSubstrings = substrings(str);

  return allSubstrings.filter(function(elem) {
    return isPalindrome(elem);
  });
}

function isPalindrome(str) {
  return str.length > 1 && str === str.split('').reverse().join('');
}

function substrings(str) {
  return str.split('').flatMap(function(current, index) {
    let currentStr = str.slice(index);
    return substringsAtStart(currentStr);
  });
}

function substringsAtStart(str) {
  return str.split('').map(function(current, index) {
    return str.slice(0, index + 1);
  });
}
