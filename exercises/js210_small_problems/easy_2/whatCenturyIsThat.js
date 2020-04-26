// What Century is That
// Write a function that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with 'st', 'nd', 'rd', or 'th' as appropriate for that number.
//
// New centuries begin in years that end with 01. So, the years 1901 - 2000 comprise the 20th century.

// Input: An integer greater than 1
// Ouput: The century number + written ending for that number

// What about zero? Let's ignore it for now

// Problems here:
// Getting the Century
// Getting the English suffix
//
// Algorithm
// Get the century
// Get the English suffix
// Return century + suffix

// Get the century:
// divide input number / 100
//   If answer is less than 1, then return 1
//   If answer does not have a fractional part (how do we determine if there's a fractional part? let's say answer * (round down) === answer)
//     answer
//   Else
//     answer + 1

// Get the English suffix: (input a number)
//  Get last number: Turn number into a string, and get last element
//  if last number is 1 then st
//  if last number is 2 then nd
//  if last number is 3 then rd
//  if last number is 4 then th
//  if last number is 5 then th
// if last number is 6 then th
// if last number is 7 then th
// if last number is 8 then th
// if last number is 9 then th
// if last number is 0 then th

// totally forgot - have to account for 11th to 19th

function centurySuffix(century) {
  var lastNumberAsString = String(century);
  var lastNumberLength = lastNumberAsString.length;
  var lastNumber = lastNumberAsString[lastNumberLength - 1];

  if (lastNumber === '1') {
    if (lastNumberAsString[lastNumberLength - 2] === '1') {
      return 'th';
    }
    return 'st';
  } else if (lastNumber === '2') {
      if (lastNumberAsString[lastNumberLength - 2] === '1') {
        return 'th';
      }

      return 'nd';
  } else if (lastNumber === '3') {
      if (lastNumberAsString[lastNumberLength - 2] === '1') {
        return 'th';
      }

      return 'rd';
  } else {
    return 'th';
  }
}

function century(year) {
  var century = year / 100;

  if (century < 1) {
    return String(1) + centurySuffix(1);
  } else if (Math.trunc(century) === century) {
    return String(century) + centurySuffix(century);
  } else {
    return Math.ceil(century) + centurySuffix(Math.ceil(century));
  }
}

// Examples:

console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"
