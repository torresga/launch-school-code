// Reverse a String
// Implement a function that takes a string as an argument and returns a new string that contains the original string in reverse.

// Input: A String
// Output: A new string

// Algorithm
// 1. Split a string into an array
// 2. Reverse the array
// 3. Join the string

// Examples
function reverse(string) {
  return string.split('').reverse().join('');
}

console.log(reverse('hello'));                  // returns "olleh"
console.log(reverse('The quick brown fox'));    // returns "xof nworb kciuq ehT"
