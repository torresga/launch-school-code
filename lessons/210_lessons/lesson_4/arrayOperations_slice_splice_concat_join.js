// Array Operations: slice, splice, concat, and join
//
// 1. Write a function named slice that accepts three arguments: an Array, a start index, and an end index. The function should return a new Array that contains values from the original Array starting with the value at the starting index, and including all values up to but not including the end index. Do not modify the original Array.

// Input: An array, a start index and an end index
// Output: a new array that contains values from the original array from the start index up to but not including the end index

// Rules
// - a new array
// - element at the end index is not included in the new array
// - cannot use any built in array methods

// Algorithm
// Create a new array, slicedArray
// Loop from start index to end index not inclusive
//   Add current element to slicedArray
// Return array

function push(array, value) {
  array[array.length] = value;
  return array.length;
}

function slice(array, startIndex, endIndex) {
  var slicedArray = [];

  var i;
  for (i = startIndex; i < endIndex; i += 1) {
    push(slicedArray, array[i]);
  }

  return slicedArray;
}

// console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
// console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]

// 2. Write a function named splice that accepts three arguments: an Array, a start index, and the number of values to remove. The function should remove values from the original Array, starting with the first index and removing the specified number of values. The function should return the removed values in a new Array.

function splice(array, start, numberOfValues) {
}

var count = [1, 2, 3, 4, 5, 6, 7, 8];
splice(count, 2, 5);                   // [ 3, 4, 5, 6, 7 ]
console.log(count);

// 3. Write a function named concat that accepts two Array arguments. The function should return a new Array that contains the values from each of the original Arrays.

// Input: Two arrays
// Output: A new array that contains elements from both original arrays.

// Algorithm
// Create a new array
// Loop through first array
//   Add elements from the first array to the new array
// Loop through second array
//  Add elements from second array to the new array
// Return new array

function concat(arr1, arr2) {
  var concatenatedArray = [];
  var i;

  for (i = 0; i < arr1.length; i += 1) {
    push(concatenatedArray, arr1[i]);
  }

  for (i = 0; i < arr2.length; i += 1) {
    push(concatenatedArray, arr2[i]);
  }

  return concatenatedArray;
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]

// 4. Write a function named join that accepts two arguments: an Array and a String. The function should coerce each value in the Array to a String, and then join those values together using the second argument as a separator. You may assume that a separator will always be passed.
//
// You can call the String function on any JavaScript value to get its String representation.

// Input: An array and a string.
// Output: A string containing the elements of the array separated by the separator string

// Algorithm
// Create a new string joinedString
// Loop through the array
//  Convert element into a string
//  Add string to joinedString
//  Add separator to string if current index < array.length - 1
// Return joinedString

function join(array, separator) {
  var joinedString = '';

  var i;
  for (i = 0; i < array.length; i += 1) {
    joinedString += String(array[i]);

    if (i < array.length - 1) {
      joinedString += separator;
    }
  }

  return joinedString;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'
