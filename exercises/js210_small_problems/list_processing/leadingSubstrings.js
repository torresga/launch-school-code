// Leading Substrings
// Write a function that takes a string argument, and returns a list of all substrings that start from the beginning of the string, ordered from shortest to longest.

// Input: A string
// Output: An array representing all the substrings sorted from the shortest to the longest

// I guess we can use map, to split string into an array and then map it to the slice of the string

// Algorithm
// 1. Split string into an array
// 2. Map array (pass in for each element the index)
// 3. Return a slice of the string from 0 to current index + 1
//

function substringsAtStart(str) {
  return str.split('').map(function(current, index) {
    return str.slice(0, index + 1);
  });
}
// Examples:

console.log(substringsAtStart('abc'));      // ["a", "ab", "abc"]
console.log(substringsAtStart('a'));        // ["a"]
console.log(substringsAtStart('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
