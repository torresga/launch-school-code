// Practice Problems: Basic Array Uses
// In the problems below, we ask you to write functions that work with Arrays. You may use Array's index access ([]), the length property, and any Array Methods you need.
//
// 1. Write a function that returns the first element of an array passed in as an argument.

// Input: An array
// Output: The first element of the array
//
// first element is array[0] so we can just return that

function firstElementOf(arr) {
  return arr[0];
}

console.log(firstElementOf(['U', 'S', 'A']));  // returns "U"

// 2. Write a function that returns the last element of an array passed in as an argument.
// Input: An array
// Output: The last element of that array

// Last element should be array.length-1 so we can just return that

function lastElementOf(arr) {
  return arr[arr.length - 1];
}

console.log(lastElementOf(['U', 'S', 'A']));  // returns "A"

// 3. Write a function that accepts two arguments, an array and an integer index position, and returns the element at the given index. What happens if the index is greater than the length of the array? What happens if it is a negative integer?

// Input: An array and an integer index position
// Output: The element at the given index

function nthElementOf(arr, index) {
  return arr[index];
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(nthElementOf(digits, 3));   // returns 16
console.log(nthElementOf(digits, 8));   // what does this return? this should return undefined
console.log(nthElementOf(digits, -1));  // what does this return? this should also return undefined

// 4. Inserting data into a negative index actually sets that array's object property. It is not an element of the array.

digits[-1] = -42;
console.log(nthElementOf(digits, -1));
console.log(digits[-1]);
console.log(digits['-1']);    // Note that we are using a string here

// 5. Write a function that accepts an array as the first argument and an integer value, count, as the second. It should return a new array that contains the first count elements of the array.

// Input: An array and an integer
// Output: A new array containing the first integer elements of the array

// Algorithm
// Create a new array
// Loop through array count times
//   Add current element to new array
// Return new array

function firstNOf(arr, count) {
  // var firstNArray = [];
  //
  // var i;
  // for (i = 0; i < count; i += 1) {
  //   firstNArray.push(arr[i]);
  // }
  //
  // return firstNArray;
  return arr.slice(0, count);
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3));    // returns [4, 8, 15]

// 6. Write a function like the previous one, except this time return the last count elements as a new array.

// Input: An array, and an integer
// Output: Return the last count elements as a new array

function lastNOf(arr, count) {
  return arr.slice(arr.length - count);
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));    // returns [16, 23, 42]

// 7. Using the function from the previous problem, What happens if you pass a count greater than the length of the array? How can you fix the function so it returns a new instance of the entire array when count is greater than the array length?

// FWIW, this only happens when the second value is anywhere from array.length+1 to array.length + array.length-1.I guess it's because count is -1. And negative integers can be used with slice, but it will return the last n of the elements in the array.

function lastNOf(arr, count) {
  // If count > array length
  //   Return a new instance of the array with all the elements
  // else
  //   return lastN of elements

  if (count > arr.length) {
    return arr.slice(0);
  } else {
    return arr.slice(arr.length - count);
  }
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, digits.length+1));
console.log(lastNOf(digits, digits.length+2))
console.log(lastNOf(digits, digits.length+digits.length));
console.log(lastNOf(digits, 30));
console.log(lastNOf(digits, 4));
console.log(lastNOf(digits, 8));

// 8. Write a function that accepts two arrays as arguments and returns an array with the first element from the first array and the last element from the second array.

// Input: Two arrays
// Output: A new array with the first element from the first array and the last element from the second array

function endsOf(beginningArr, endingArr) {
  return [beginningArr[0], endingArr[endingArr.length - 1]];
}

console.log(endsOf([4, 8, 15], [16, 23, 42]));  // returns [4, 42]
