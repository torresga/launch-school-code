// Name Swapping
// Write a function that takes a string argument consisting of a first name, a space, and a last name, and returns a new string consisting of the last name, a comma, a space, and the first name.

// Input: A string
// Output: A string

// Rules:
// - String input consists of first name, space, and last name
// - output string consists of last name, comma, space, and first name

// Data structures
// can split string into an array and then turn it back into a String

// Algorithm
// Create new variable for array
// Split string into an array on spaces
// Return last element + comma and space + first name

function swapName(name) {
  var nameArray = name.split(' ');
  return nameArray[nameArray.length - 1] + ', ' + nameArray.slice(0, nameArray.length - 1).join(' ');
}

// Examples:

console.log(swapName('Joe Roberts'));    // "Roberts, Joe"
console.log(swapName('Jonathan Taylor Thomas'));    // "Thomas, Jonathan Taylor"
console.log(swapName('John Jacob Jingleheimer Smith'));    // "Smith, John Jacob Jingleheimer
// Further Exploration
// What if the person had more than one first name? Refactor the current solution so that it can accommodate this.
