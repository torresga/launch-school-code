// How Many
// Write a function that counts the number of occurrences of each element in a given array. Once counted, log each element alongside the number of occurrences.

// Input: An array
// Output: an object containing each element in the string and the count of times the element appeared in the array

// Data Structure
// Input is an array
// We can represent element and count of elements as an array
//
// Algorithm
// Create a new object
// Loop over array
//   If object includes current element in the array as a key
//     Add 1 to the value
//   Else
//     Add key and value to object
//
// Loop through object
// Output key + => value

function countOccurrences(array) {
  var counts = {};
  var i;
  var currentWord;

  for (i = 0; i < array.length; i += 1) {
    currentWord = array[i];
    if (Object.keys(counts).indexOf(currentWord) !== -1) {
      counts[currentWord] += 1;
    } else {
      counts[currentWord] = 1;
    }
  }

  for (currentWord in counts) {
    console.log(currentWord + ' => ' + String(counts[currentWord]));
  }
}

// Example:

var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
