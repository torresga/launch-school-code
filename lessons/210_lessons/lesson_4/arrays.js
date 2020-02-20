// 1. With arrays, you can access the first element's value with [0], but how do you access the last value? Write a function named lastInArray that returns the value of the last element in the array provided by the function's argument. You may use the length property and the [] operator, but do not use any other methods or properties.

// Input: An array
// Output: The value of the last element in the array

function lastInArray(array) {
  index = array.length - 1;
  return array[index];
}

var input = [1, 2, 3];
console.log(lastInArray(input));

// 2. Create a function named rollCall that takes an array of first names as an argument and logs all the names to the console, one name per line. You should log the names in the same sequence they appear in the array. Use a for loop to process the array.

// Input: An array of names
// Output: Each name is output one per line

function rollCall(arr) {
  for (var i = 0; i < arr.length; i += 1) {
    console.log(arr[i]);
  }
}

var names = ['trip', 'lulu', 'fifi', 'mischa', 'gobo'];
rollCall(names);

// 3. Create a function that returns the contents of the array it receives as an argument, but with the values in reversed order. Your function should use a for loop that iterates over the elements in the array from the end of the array to the beginning, and pushes each element's value to a new result array. Be sure to start your loop with the element whose index is one less than the input array's length.

// Input: An array
// Output: An array in reversed order
//
// Use a for loop that iterates over the elements in the array from the end of the array to the beginning
// Push each element's value to a new result array

function reversedArray(array) {
  var reversedArr = [];

  for (var i = array.length - 1; i >= 0; i -= 1) {
    reversedArr.push(array[i]);
  }

  return reversedArr;
}

console.log(reversedArray(names));

// 4. Create a function that finds the first instance of a value in an array and returns the index position of the value, or -1 if the value is not in the array. The function should take two arguments: the value to search for, and the array to search. Use the break keyword to exit the loop immediately when you find the first instance of the value. If you don't find the value, make sure you don't use the final index value as your return value.

// Input: Value to search for, array to search
// Output: The index of the item in the array, or -1

// Loop through the array
//   If current element === value
//     return current index;
//     break;
//
// Return -1

function firstInstance(searchTerm, array) {
  var indexOfSearchTerm = -1;

  for (var i = 0; i < array.length; i += 1) {
    if (searchTerm === array[i]) {
      indexOfSearchTerm = i;
      break;
    }
  }

  return indexOfSearchTerm;
}

console.log(firstInstance('fifi', names));
console.log(firstInstance('ryan', names));

// 5. Write a function that returns a string of all the values in an array with no intervening content. For example, your function should return '1a4' if the argument is [1, 'a', 4]. Use a for loop to process the array elements in sequence, and coerce each value in the array to a String before concatenating it to the result string.

// Input: An array
// Output: A string of each element in the array joined together with no intervening content

// Create a new string, joinedElements
// Loop through the array
//   Coerce element into a String
//   Add String to the new String
// Return the new string

function joinElements(array) {
  var joinedElements = '';

  for (var i = 0; i < array.length; i += 1) {
    joinedElements += String(array[i]);
  }

  return joinedElements;
}

var elements = [1, 2, 'twenty-three', 'eleventy', 22];
console.log(joinElements(elements));
