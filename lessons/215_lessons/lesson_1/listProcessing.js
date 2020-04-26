// Goal: write a function named myForEach that is similar to forEach method.
// Input: an array and another function
// Output: undefined

// Rules:
// - input function should mutate a variable in the outer scope

// Algorithm
// Loop through the array
// Call the function for each element of the array and pass into it the three things that forEach passes into it: current element, index, array

function myForEach(array, func) {
  for (let i = 0; i < array.length; i += 1) {
    func(array[i], i, array);
  }
}

// Goal: build a function that's similar to Array.prototype.filter
// Input: An array and a function
// Output: a new array that contains only the elements for which the return value of the function is true

// Algorithm
// Create a new array
// Loop through the input array
//   Call callback function and pass it current element, index of current element, and the array being iterated over
//   Get the return value of callback function
//   If return value of callback function is true
//     Add current element to new array

// Return new array

function myFilter(array, func) {
  let filteredElements = [];

  for (let i = 0; i < array.length; i += 1) {
    if (func(array[i], i, array)) {
      filteredElements.push(array[i]);
    }
  }

  return filteredElements;
}

let isPythagoreanTriple = function (triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
};

console.log(myFilter([{ a: 3, b: 4,  c: 5 },
          { a: 5, b: 12, c: 13 },
          { a: 1, b: 2,  c: 3 },], isPythagoreanTriple));

returns [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ]

// Goal: write a function that is similar to Array.prototype.map method
// Input: An array and a callback function
// Output: a new array

// Rules
// - Each element of the new array is the return value of the callback function

// Algorithm
// Create a new array
// Loop through the input array
//   Pass current element, index of current element, and array to the callback function
//   Get return value of callback function
//   Add return value of callback function to new array
// Return new array

function myMap(array, func) {
  let transformedArray = [];

  // for (let i = 0; i < array.length; i += 1) {
  //   let currentCallbackValue = func(array[i], i, array);

  //   transformedArray.push(currentCallbackValue);
  // }

  array.forEach(function(value) {
    transformedArray.push(func(value));
  });

  return transformedArray;
}

// Goal: build a function thats similar to Array.prototype.reduce
// Input: array and a function and optional third argument
// Output: the value returned by the last invocation of the callback function

// Algorithm
// Create a new variable
// Assign new variable to initial
// Loop through the array
//   Add return value of the function to new variable
// Return new variable

function myReduce(array, func, initial) {
  let result;
  let index;

  if (initial === undefined) {
    result = array[0];
    index = 1;
  } else {
    result = initial;
    index = 0;
  }

  array.slice(index).forEach(function(value) {
    result = func(result, value);
  });

  return result;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49

// Goal: write a function that's similar to Array.prototype.every
// Input: An array and a function
// Output: A boolean - true if every element's return value is true, else false

// Algorithm
// Loop through the array
// Call callback function and pass value into it
// If return value of callback function is false
//   Return false
// Else
//   Return true

function myOwnEvery(array, func) {
  for (let i = 0; i < array.length; i += 1) {
    if (!func(array[i], i, array)) {
      return false;
    }
  }

  return true;
}

let isAString = value => typeof value === 'string';
console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true
console.log(myOwnEvery([1, 'a', 'a234'], isAString)); // false
