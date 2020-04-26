// All Substrings
// Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, return the substrings at a given position from shortest to longest.
//

// Input: A string
// Output: An array of substrings

// Algorithm
// 1. Split string into an array
// 2. Map array
  // Turn each element into a slice of the string.
  // Call substringsAtStart on each element


// You may (and should) use the substringsAtStart function you wrote in the previous exercise:
//
// Example:

// substrings('abcde');

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]

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

console.log(substringsAtStart('abcde'));
console.log(substrings('abcde'));
