// Array Concat Part 2
// The concat function from the previous exercise could only concatenate a maximum of two arrays. For this exercise, you are going to extend that functionality. Refactor the concat function to allow for the concatenation of two or more arrays or values.

// Input: 2 or more arrays or values.
// Output: One new array.

// Algorithm
// Create a new array
// Loop through the first array
//   Add current element to new array
// Loop through the rest of the objects in the arguments object
// If current element is an array
//  Loop through the array
//    Add current element to new array
// Else
//  Push element to new array
// Return array

function concat() {
  var newArray = [];
  var i;
  var j;

  for (var i = 0; i < arguments.length; i += 1) {
    if (Array.isArray(arguments[i])) {
      for (j = 0; j < arguments[i].length; j += 1) {
        newArray.push(arguments[i][j]);
      }
    } else {
      newArray.push(arguments[i]);
    }
  }

  return newArray;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]
