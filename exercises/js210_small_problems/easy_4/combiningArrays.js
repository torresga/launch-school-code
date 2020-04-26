// Combining Arrays
// Write a function that takes two arrays as arguments, and returns an array containing the union of the values from the two. There should be no duplication of values in the returned array, even if there are duplicates in the original arrays. You may assume that both arguments will always be arrays.

// Input: Two arrays
// Output: A new array containing each element in both arrays only once

// Rules:
// - Elements in each array should appear in the new array only once
// - can we assume that both arrays are the same length?
//
// Data Structure
// arrays
//
// Algorithm
// Create a new array to hold union
// Create a new array to add both first and second Arrays
// Loop through the big array
//  If current element is not in union
//    Add it to union array
// Return union

function union(first, second) {
  var union = [];
  var combinedArray = first.concat(second);
  var i;

  for (i = 0; i < combinedArray.length; i += 1) {
    if (!union.includes(combinedArray[i])) {
      union.push(combinedArray[i]);
    }
  }

  return union;
}

// Example:

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]
