// 1. Write a function named push that accepts two arguments: an Array and any other value. The function should append the second argument to the end of the Array, and return the new length of the Array.

// Input: An array and another value. The first value represents the array. The second value represents the value to be appended to the array.
// Output: The new length of the array

// Algorithm
// Get length of the array
// Assign array at array's length the new value
// Return array's length

function push(array, value) {
  array[array.length] = value;
  return array.length;
}

var count = [0, 1, 2];
console.log(push(count, 3));         // 4
console.log(count);                  // [ 0, 1, 2, 3 ]

// 2. Write a function named pop that accepts one argument: an Array. The function should remove the last element from the array and return it.
//

// Input: An array
// Output: The last element from the array

// Algorithm
// Get last element of the array
// Assign that to a new variable
// Assign length of the array to array's length - 1
// Return new variable that contains last element from the array

function pop(array) {
  var lastElement = array[array.length-1];
  array.length = array.length - 1;

  return lastElement;
}

var count = [1, 2, 3];
console.log(pop(count));             // 3
console.log(count);                  // [ 1, 2 ]

// 3. Write a function named unshift that accepts two arguments: an Array and a value. The function should insert the value at the beginning of the Array, and return the new length of the array. You will need a for loop for this problem.

// Input: Array and a value
// Output: the new length of the array
//
// This method is mutating
// Maybe we have to keep track of current element?

// Assign value to newValue
// Loop through array
  // Assign current element to variable, formerValue
  // Assign element at current index to newValue
  // Assign newValue to formerValue

// Since apparently we cannot change the length of the array while we are looping through it, we have to assign newValue to array[array.length]
// Return new array.length

function unshift(array, value) {
  var newValue = value;
  var formerValue;
  for (var i = 0; i < array.length; i += 1) {
    formerValue = array[i];
    array[i] = newValue;
    newValue = formerValue;
  }

  array[array.length] = newValue;

  return array.length;
}

console.log('Unshift:')
var count = [1, 2, 3];
console.log(unshift(count, 0));      // 4
console.log(count);                  // [ 0, 1, 2, 3 ]

// 4. Write a function named shift that accepts one argument: an Array. The function should remove the first value from the beginning of the Array and return it.

// Input: An array
// Output: The first value of the array at index 0
// This method is mutative

// Algorithm
// assign array[0] to firstElement
// Loop through the array
//   Assign to current index the element after it
// Assign array.length to current length - 1
// Return firstElement

function shift(array) {
  var firstElement = array[0];
  newLength = array.length - 1;

  for (var i = 0; i < array.length; i += 1) {
    array[i] = array[i + 1];
  }

  array.length = newLength;

  return firstElement;
}

console.log('Shift:')
var count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]
