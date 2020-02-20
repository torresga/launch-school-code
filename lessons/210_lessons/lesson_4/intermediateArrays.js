// Practice Problems: Intermediate Array Uses
//
// 1. Write a function that creates and returns a new array from its array argument. The new array should contain all values from the argument array whose positions have an odd index.

// Input: an array
// Output: a new array that contains all the odd-index elements of the array

// Algorithm
// 1. Create a new array
// 2. Loop over odd elements in old array
//  Add current element to new array
// 3. Return new array

function oddElementsOf(arr) {
  var oddElements = [];

  var i;
  for (i = 1; i < arr.length; i += 2) {
    oddElements.push(arr[i]);
  }

  return oddElements;
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits));    // returns [8, 16, 42]

// 2. Write a function that takes two arrays and returns a new array whose even positions come from the first array, and whose odd positions come from the second array. Assume that both arrays have equal length.

// Input: Two arrays
// Output: A new array whose even positions come from the first array and whose odd positions come from the second array (this means that the two arrays are interleaved in the third array)
// They are of the same length, so we don't need to loop over both arrays. We can just loop over one, and use the same index for each

// Algorithm
// Create a new array combined
// Loop to even array.length
//  Add element from even array to combined
//  Add element from odd array to combined

// Return new combined array

function combinedArray(even, odd) {
  var combined = [];

  var i;
  for (i = 0; i < even.length; i += 1) {
    combined.push(even[i]);
    combined.push(odd[i]);
  }

  return combined;
}

var digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];

console.log(combinedArray(digits, letters));  // returns [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]

// 3. Write a function that takes an array argument and returns a new array that contains all the argument's elements in their original order followed by all the argument's elements in reverse order.

// Input: an array
// Output: a new array that contains elements in original order and elements in reverse order

// Algorithm
// Create a new array
// Add current array to new array
// Add reversed array to new array:
//  Slice array and reverse it
// Return new array

// Or using loops:
// Create a new array
// Loop over array
//   Add current value to new array
// Loop over array backwards
//   Add current value to new array
// Return new array

// Example:

function mirroredArray(array) {
  var reversedArray = array.slice(0).reverse();

  return array.concat(reversedArray);
}

var letters = ['A', 'L', 'V']

console.log(mirroredArray(letters)) // ['A', 'L', 'V', 'V', 'L', 'A']

var digits = [4, 8, 15, 16, 23, 42];
console.log(mirroredArray(digits));  // returns [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4]

// 4. Use the array sort method to create a function that takes an array of numbers and returns a new array of the numbers sorted in descending order. Do not alter the original array.

// Input: An array of numbers
// Output: an array of numbers sorted in descending order

// Rules: we do not alter the original array - that means we have to make a copy with slice.

// ONE THING TO NOTE - the default action of sort turns each element into a string before sorting. That is why array.sort is [ 15, 16, 23, 4, 42, 8 ] instead of [4, 8, 15, 16, 23, 42]. We have to figure out how to keep those elements as numbers so we can sort them numerically.

// Algorithm
// Copy the array with slice
// Sort the new copy of the array
// Reverse the copy of the array
// Return the new array

// This function tells sort to compare numbers (I guess because only number types have substraction?)
function compareNumbers(a, b) {
  return a - b;
}

function sortDescending(arr) {
  return arr.slice().sort(compareNumbers).reverse();
}

var array = [23, 4, 16, 42, 8, 15];
var result = sortDescending(array);  // returns [42, 23, 16, 15, 8, 4]
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]

// 5. Write a function that takes an array of arrays as an argument, and returns a new array that contains the sums of each of the sub-arrays.
//
// Input: An array of arrays
// Output: A new array containing the sums of each of the sub arrays
//
// Can we use reduce to sum up each of the arrays?
//
// Reducer: Takes a function that needs accumulator, current value
// And it needs initial value as an argument

// Algorithm

// Create a new array allSums
// Loop through the array
//   Reduce each individual array
//   Add reduced value to allSums
//
// Return allSums

function sum(accumulator, currentValue) {
  return accumulator + currentValue;
}

function matrixSums(arr) {
  var allSums = [];

  var i;
  var currentArray;
  for (i = 0; i < arr.length; i += 1) {
    currentArray = arr[i];
    allSums.push(currentArray.reduce(sum));
  }

  return allSums;
}

// Algorithm
// Create a new array
// Loop through the old array
// Create a sum variable
// Loop through each individual array
//  Add each element to sum
// Add sum to new array
// Return new array

function matrixSums(arr) {
  var i;
  var j;
  var currentArray;
  var sumOfSums = [];
  var currentSum;

  for (i = 0; i < arr.length; i += 1) {
    currentSum = 0;
    currentArray = arr[i];
    for (j = 0; j < currentArray.length; j += 1) {
      currentSum += currentArray[j];
    }

    sumOfSums.push(currentSum);
  }

  return sumOfSums;
}
console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));
 // returns [15, 60, 12]

// 6. Write a function that takes an array, and returns a new array with duplicate elements removed.

// Input: an array
// Output: a new array with all unique elements

// Algorithm
// Create a new array
// Loop through array
//  If element is NOT in new array
//    Add to new array
// Return new array

// How to check whether element is in new array (provided a value):
// Loop through new array
//   Return true if current element in array is equal to value
// Return false

function inArray(arr, value) {
  var i;
  for (i = 0; i < arr.length; i += 1) {
    if (arr[i] === value) {
      return true;
    }
  }

  return false;
}

function uniqueElements(arr) {
  var uniqueArr = [];
  var i;

  for (i = 0; i < arr.length; i += 1) {
    if (inArray(uniqueArr, arr[i]) === false) {
      uniqueArr.push(arr[i]);
    }
  }

  return uniqueArr;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]
