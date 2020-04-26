// Alphabetical Numbers
// Write a function that takes an array of integers between 0 and 19, and returns an array of those integers sorted based on the English word for each number:
//
// zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
//

// Input: An array of numbers
// Output: An array of numbers sorted based on the english word for each number
//
// - does this function return the same or a new array???
// - we will have to figure out how to sort by english word - perhaps make an object of key-value pairs, with number as the key and the english word as the value?

// To sort by a value, we will have to write a function that returns -1, 1, or 0.

// Algorithm
// 0. Create an object with number as key, and english word as value
// 1. Make a new copy of the array
// 2. Sort the copied array
//   Sort by the value of an object where the current number is a key

// For a and b
// If object[a] < object[b]
//  return -1

// if object[a] > object[b]
  // return 1

// return 0

function alphabeticNumberSort(numbers) {
  let numbersCopy = numbers.slice();
  const numbersAsWords = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    11: 'eleven',
    12: 'twelve',
    13: 'thirteen',
    14: 'fourteen',
    15: 'fifteen',
    16: 'sixteen',
    17: 'seventeen',
    18: 'eighteen',
    19: 'nineteen',
  }

  return numbersCopy.sort(function(firstWord, secondWord) {
    if (numbersAsWords[firstWord] < numbersAsWords[secondWord]) {
      return -1
    }

    if (numbersAsWords[firstWord] > numbersAsWords[secondWord]) {
      return 1;
    }

    return 0;
  });
}

// Example:

console.log(alphabeticNumberSort(
   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
