// Array and String Reverse
// In this exercise, you will implement your own version of the Array.prototype.reverse method. Your implementation should differ from the built-in method in the following two ways:
//
// It should accept either a string or an array as an argument.
// It should return a new string or array.

// Input: A string or an Array
// Output: A new string or an array

// Algorithm
// Create a new variable for input
// If input is an array, assign variable to an array
//   Loop through array
//   Assign current element to array
// Else assign variable to a string
//  Loop through array
//    Assign current element to String
// Return reversedInput

// Examples:

function reverse(inputForReversal) {
  var reversedInput;
  var i;

  if (Array.isArray(inputForReversal)) {
    reversedInput = [];
    for (i = inputForReversal.length - 1; i >= 0; i -= 1) {
      reversedInput[reversedInput.length] = inputForReversal[i];
    }
  } else {
    reversedInput = '';
    for (i = inputForReversal.length - 1; i >= 0; i -= 1) {
      reversedInput += inputForReversal[i];
    }
  }

  return reversedInput;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

var array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]
