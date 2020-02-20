// 1. Write a function indexOf that accepts two arguments: an array and a value. The function returns the first index at which the value can be found, or -1 if the value is not present.

// Input: An array, and a value
// Output: The first index at which the value can be found, or -1

// Algorithm

// assign -1 to variable firstIndex
// Loop through the array
//  If current element == value
//    Assign index to firstIndex
//    Break
// Return firstIndex

function indexOf(array, value) {
  var firstIndex = -1;

  var i;
  for (i = 0; i < array.length; i += 1) {
    if (value === array[i]) {
      firstIndex = i;
      break;
    }
  }

  return firstIndex;
}

console.log(indexOf([1, 2, 3, 3], 3));         // 2
console.log(indexOf([1, 2, 3], 4));            // -1

// 2. Write a function lastIndexOf that accepts two arguments: an array and a value. The function returns the last index at which the value can be found in the array, or -1 if the value is not present.

// Input: An array and a value
// Output: The last index at which the value can be found, or -1

// Algorithm
// Loop through the array backwards
//   If current element == value
//     Return index
//
// Return -1

function lastIndexOf(array, value) {
  var i;
  for (i = array.length - 1; i >= 0; i -= 1) {
    if (array[i] === value) {
      return i;
    }
  }

  return -1;
}

console.log(lastIndexOf([1, 2, 3, 3], 3));     // 3
console.log(lastIndexOf([1, 2, 3], 4));        // -1
