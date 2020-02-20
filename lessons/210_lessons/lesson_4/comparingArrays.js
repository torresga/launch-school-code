// Practice Problem: Comparing Arrays
// In the last assignment, we saw that JavaScript's equality operators don't examine the values in the arrays—instead, they check that the arrays are the same object. It's more likely that you'll want to know whether two arrays contain the same values. To do this, you need to write your own function.
//
// Write a function named arraysEqual that takes two arrays as arguments. The function should return true if the arrays contain the same values, or false if they do not.
//
// Test the function with arrays that contain number, string, and boolean values. Don't worry about handling arrays that contain other Arrays or Objects.

// Input: Two arrays
// Output: A boolean

// Return false if length of the first array does not equal length of the second array
// Otherwise, we can loop through first array
// Loop through second array
//   Return false if current element in first array does not equal current element in second array
//
// Return true

function arraysEqual(firstArray, secondArray) {
  if (firstArray.length != secondArray.length) {
    return false;
  }

  var i;
  for (i = 0; i < firstArray.length; i += 1) {
    if (firstArray[i] !== secondArray[i]) {
      return false;
    }
  }

  return true;
}

console.log(arraysEqual([1], [1]));                               // true
console.log(arraysEqual([1], [2]));                               // false
console.log(arraysEqual([1, 2], [1, 2, 3]));                      // false
console.log(arraysEqual([1, 'hi', true], [1, 'hi', true]));       // true
console.log(arraysEqual([1, 'hi', true], [1, 'hi', false]));      // false
console.log(arraysEqual([1, 'hi', true], [1, 'hello', true]));    // false
console.log(arraysEqual([1, 'hi', true], [2, 'hi', true]));       // false
