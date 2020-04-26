// Problem Description
// You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

// Your job is to return a list of complete numbers.

// The possible separators are: ["-", ":", ".."]

// "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
// "1-3, 1-2" --> 1, 2, 3, 11, 12
// "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
// "104-2" --> 104, 105, ... 112
// "104-02" --> 104, 105, ... 202
// "545, 64:11" --> 545, 564, 565, .. 611

// Input: A string representing a list of numbers
// - Each element in the list is represented by a comma
// - Each range is separated by .., -, or :.

// Output:
// - An array of numbers

// Rules:
// - Turning string into an array of numbers. What number is depends on the position in the array. Previous number determines what the current number is.
// - Have to expand the ranges. Both beginning and ending numbers are included in the range.

// Test cases:
// expandNumbers("1, 3, 7, 2, 4, 1") // [1, 3, 7, 12, 14, 21]
// expandNumbers("1-3, 1-2") // [1, 2, 3, 11, 12]
// expandNumbers("1:5:2") // [1, 2, 3, 4, 5, 6, ... 12]
// expandNumbers("104-2") // [104, 105, ... 112]
// expandNumbers("104-02") // [104, 105, ... 202]
// expandNumbers("545, 64:11") // [545, 564, 565, .. 611]
// expandNumbers('5:5') // [5]
// expandNumbers("1, 3, 7, 2, 4..1") // [1, 3, 7, 12, 14, 21]
// expandNumbers('545') // [545]

// Edge cases:
// Empty string
// Numbers that dont include any separators

// Data Structures
// Going from string to an array of numbers
// Input: string
// Output: array of numbers
// Transitional data structure - strings and string methods such as slice


// Two problems:
// Given a string separated by ':-..', return an array containing all the full numbers between start and end, in order, without any duplicates

// Input: a String separated by ; - ..
// Output: An array of numbers represented as strings
// 1. Split string on :-..
// 2. If resulting array's length is 2 then the array is fine
    // 3. if the resulting array's length is 3 then reassign the last number with the next largest number
// 2. Create a new array
// 3. Create a counter and start it at the first number
// 4.  While counter doesnt end with last number
// 5.    Add counter to new array if counter isnt already in new array
// 6.    Add 1 to counter
// 7.  Add counter to new array
// 8. Return new array

// ['104', '2']
// [['1', '5'], ['5', '2']]
function expandRange(range) {
  let endpoints = range.split(/[-:]|\.{2}/g);

  if (endpoints.length > 2) {
    let last = Number(endpoints[endpoints.length - 1]);
    let nextToLast = Number(endpoints[endpoints.length - 2]);

    endpoints[endpoints.length - 1] = String(getNextLargestNumber(nextToLast, last));
  }

  let fullArray = [];
  let counter = Number(endpoints[0]);
  let lastNumber = endpoints[endpoints.length - 1];

  while (String(counter).slice(-Number(lastNumber.length)) !== lastNumber) {
    if (!fullArray.includes(counter)) {
      fullArray.push(counter);
    }

    counter += 1;
  }

  fullArray.push(counter);
  return fullArray;
}

// console.log(expandRange("1-3")); // [1, 2, 3]
// console.log(expandRange("1:5:2")); // [1, 2, 3, 4, 5, 6, ... 12]
// console.log(expandRange("104-2")); // [104, 105, ... 112]
// console.log(expandRange("104-02")); // [104, 105, ... 202]
// console.log(expandRange('4..1'));

// Get next largest number:
// Input: previous number, current number
// Create new variabled increasedNumber and assign it to current number

// While increased number < previous number
//   increased number += 10

// return increased number

function getNextLargestNumber(previous, current) {
  let currentNumber = current;
  let powerOf10 = String(previous).length == 1 ? 1 : String(previous).length - 1;

  while (currentNumber < previous) {
    // we have to add 10 or 100 or above, depending on how many digits the number has
    currentNumber += (10 ** powerOf10);
  }

  return currentNumber;
}

// console.log(getNextLargestNumber(1, 5));
// console.log(getNextLargestNumber(5, 2));


// Given a string separated by ',' , return an array in order.

// Algorithm:
// 1. Split string into an array of numbers as strings
// 2. For each range in array, expand it to the full range of numbers
// 3. Loop through array
//   If current number is < than previous number
//     Add 10 until current number is > than previous number
//     Return the sum as the new current number
// 4. Return transformed array

function expandNumbers(list) {
  let listAsArr = list.split(',').map(function(elem) {
    if (/[-:]|\.{2}/g.test(elem)) {
      return expandRange(elem);
    } else {
      return Number(elem);
    }
  }).reduce(function(arr, elem) {
    return arr.concat(elem);
  }, []);

  let previousNumber;
  let currentNumber;
  let ordered = [listAsArr[0]];

  for (let i = 1; i < listAsArr.length; i += 1) {
    previousNumber = ordered[ordered.length - 1];
    currentNumber = getNextLargestNumber(previousNumber, listAsArr[i]);
    ordered.push(currentNumber);
  }

  return ordered;
}


console.log(expandNumbers("1, 3, 7, 2, 4, 1")); // [1, 3, 7, 12, 14, 21]
console.log(expandNumbers("1-3, 1-2")); // [1, 2, 3, 11, 12]
console.log(expandNumbers("1:5:2")); // [1, 2, 3, 4, 5, 6, ... 12]
console.log(expandNumbers("104-2")); // [104, 105, ... 112]
console.log(expandNumbers("104-02")); // [104, 105, ... 202]
console.log(expandNumbers("545, 64:11")); // [545, 564, 565, .. 611]
console.log(expandNumbers('5:5')); // [5]
console.log(expandNumbers("1, 3, 7, 2, 4..1")); // [1, 3, 7, 12, 14... 21]
console.log(expandNumbers('545')); // [545]
