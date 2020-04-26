// Find the Duplicate
// Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), determine which value occurs twice. Write a function that will find and return the duplicate value that is in the array.

// Input: an unordered array
// Output: a number

// Exactly one element in the array occurs twice
// Work with two loops.
//   Outer loop loops from 0 to length: we get the current element
//   Inner loop we loop from current element + 1 to end of array

// We should probably have our function return something if there is no duplicate. null? or undefined?


// Data Structures
// unordered array
// number

// Algorithm
// Create a new variable, duplicate
// Loop from 0 to length
//   Assign current element to duplicate
//   Loop from current element + 1 to end of array
//     If current element of inner loop is equal to duplicate
//       Return duplicate

// Code

function findDup(array) {
  var duplicate;
  var i;
  var j;

  for (i = 0; i < array.length; i += 1) {
    duplicate = array[i];

    for (j = i + 1; j < array.length; j += 1) {
      if (duplicate === array[j]) {
        return duplicate;
      }
    }
  }
}


// Examples:

console.log(findDup([1, 5, 3, 1]));                                // 1
console.log(findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
         38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
         14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
         78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
         89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
         41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
         55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
         85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
         40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7, 34, 57, 74, 45, 11, 88, 67,  5, 58]));    // 73
