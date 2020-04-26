// Array Slice and Splice
// In this exercise, you will implement your own versions of the Array.prototype.slice and Array.prototype.splice methods according to the following specifications.
//
// The slice function takes three arguments: an array, and two integers representing a begin and an end index. The function returns a new array containing the extracted elements starting from begin up to but not including end. slice does not mutate the original array.
//
// The splice function changes the contents of an array by deleting existing elements and/or adding new elements. The function takes the following arguments: an array, a start index, a deleteCount, and zero or more elements to be added. The function removes deleteCount number of elements from the array, beginning at the start index. If any optional element arguments are provided, splice inserts them into the array beginning at the start index. The function returns a new array containing the deleted elements, or an empty array ([]) if no elements are deleted. splice mutates the original array.
//
// Additional specifications:
//
// slice:
//
// The values of begin and end will always be integers greater than or equal to 0.
// If the value of begin or end is greater than the length of the array, set it to equal the length.
// splice:
//
// The values of start and deleteCount will always be integers greater than or equal to 0.
// If the value of start is greater than the length of the array, set it to equal the length.
// If the value of deleteCount is greater than the number of elements from start up to the end of the array, set deleteCount to the difference between the array's length and start.
// Takes optional arguments for elements to add to the array; denoted by the parameters element1 up to elementN. If no elements to add are provided, splice only removes elements from the array.

// Slice:
// Input: an array, and two integers
// Output: A new array
//
// There is a begin index
// There is an end index
// Returns a new array containing elements starting from begin up to but not including end
// If value of begin or end is greater than the length of the array, set it to equal the length
// Does not mutate original array

// Algorithm
// Create new variable for the new array slicedArray
// If begin > length of the input array
//  begin = length
// if end > length of the input array
//  end = length
// Loop through the array from begin to end
//  Add current element to slicedArray
// return slicedArray

// Examples:

function slice(array, begin, end) {
  var i;
  var slicedArray = [];


  if (begin > array.length) {
    begin = array.length;
  }

  if (end > array.length) {
    end = array.length;
  }

  for (i = begin; i < end; i += 1) {
    slicedArray.push(array[i]);
  }

  return slicedArray;
}

console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

var arr = [1, 2, 3];
console.log(slice(arr, 1, 3));                     // [2, 3]
console.log(arr);                                  // [1, 2, 3]

// Splice:
//
// Input: An array, a start index, a deleteCount, and zero or more elements to be added
// Output: a new array containing the deleted elements or an empty array if no elements are deleted
//
// Splice removes deleteCount number of elements starting at start
// Mutates the original array
// If start > array.length, set start to array.length
// if deleteCount > array.length - start, set deleteCount to array.length - start
// Arguments after deleteCount are optional


// From examples, it looks like element is added and then the rest of the elements shift by one
// If deleteCount is not 0, either we delete or replace that element
// Otherwise if deleteCount is 0, we add any elements at that element and then shift the array downward

// Get arguments from 3 and onward and put in newElements.
// Loop from third argument to end of arguments.length
//  Push current element to newElements
// If start > array.length, set start to array.length
// if deleteCount > array.length - start, set deleteCount to array.length - start

// Create new array for oldElements
// Loop through the array from start to start + deleteCount
//  Add current element to oldElements

// Return oldElements

function splice(array, start, deleteCount, element1, elementN) {
  var newElements = [];
  var oldElements = [];
  var i;

  for (i = 3; i < arguments.length; i += 1) {
    newElements.push(arguments[i]);
  }

  for (i = start; i < start + deleteCount; i += 1) {
    oldElements.push(array[i]);
    array[i] = undefined;
  }

  console.log(oldElements);
  console.log(array);
}

console.log('splice:');
// splice([1, 2, 3], 1, 2);              // [2, 3]
// splice([1, 2, 3], 1, 3);              // [2, 3]
// splice([1, 2, 3], 1, 0);              // []
// splice([1, 2, 3], 0, 1);              // [1]
splice([1, 2, 3], 1, 0, 'a');         // []
//
var arr = [1, 2, 3];
splice(arr, 1, 1, 'two');             // [2]
arr;                                  // [1, "two", 3]

var arr = [1, 2, 3];
splice(arr, 1, 2, 'two', 'three');    // [2, 3]
arr;                                  // [1, "two", "three"]
//
var arr = [1, 2, 3];
splice(arr, 1, 0);                    // []
splice(arr, 1, 0, 'a');               // []
arr;                                  // [1, "a", 2, 3]

var arr = [1, 2, 3];
splice(arr, 0, 0, 'a');               // []
arr;                                  // ["a", 1, 2, 3]
