// Array Pop and Push
// In this exercise, you will implement your own version of two Array methods: Array.prototype.pop and Array.prototype.push. The pop method removes the last element from an array and returns that element. If pop is called on an empty array, it returns undefined. The push method, on the other hand, adds one or more elements to the end of an array and returns the new length of the array.

// Pop:
// Input: an array
// Output: The last element of that array

// If called on an empty method, it returns undefined

// Algorithm
// Return undefined if input array is empty
// Create a new variable lastElement
// Add last element of the array to lastElement
// Assign to array length the current array length - 1
// Return lastElement

function pop(array) {
  var newLength = array.length - 1;
  var lastElement;

  if (array.length === 0) {
    return undefined;
  }

  lastElement = array[newLength];
  array.length = newLength;
  return lastElement;
}

// Examples:

// pop
var array = [1, 2, 3];
console.log(pop(array));                        // 3
console.log(array);                // [1, 2]
console.log(pop([]));                           // undefined
console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]

// Push:
// Input: An array, and one or more elements
// Output: The new length of the array
// It looks like the first argument has to be an array, because that is the array we are modifying.

// Algorithm
// Loop from the second to the last arguments
//    Add element to the end of the array
// Return new length of the array

function push() {
  var firstArray = arguments[0];

  var i;
  for (i = 1; i < arguments.length; i += 1) {
    firstArray[firstArray.length] = arguments[i];
  }

  return firstArray.length;
}

// push
var array = [1, 2, 3];
console.log(push(array, 4, 5, 6));              // 6
console.log(array);                // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0
