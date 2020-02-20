// Substring (2)
// This practice problem is similar to the previous one. This time though, both arguments are indices of the provided string. The following rules apply:
//
// If both start and end are positive integers, start is less than end, and both are within the boundary of the string, return the substring from the start index (inclusive), to the end index (NOT inclusive).
// If the value of start is greater than end, swap the values of the two, then return the substring as described above.
// If start is equal to end, return an empty string.
// If end is omitted, the end variable inside the function is undefined. Return the substring starting at position start up through (and including) the end of the string.
// If either start or end is less than 0 or NaN, treat it as 0.
// If either start or end is greater than the length of the string, treat it as equal to the string length.
// Examples
// function substring(string, start, end) {
//   // ...
// }
//
// var string = 'hello world';
//
// substring(string, 2, 4);    // "ll"
// substring(string, 4, 2);    // "ll"
// substring(string, 0, -1);   // ""
// substring(string, 2);       // "llo world"
// substring(string, 'a');     // "hello world"
// substring(string, 8, 20);   // "rld"

// Input: A string, a start, and an end
// Output: A string representing the substring between start and end

// start is the index of where the substring starts
// end is the index of where the substring ends
// Main condition:
// start and end are positive, start is less than end, start and end are within the boundary of the string

// If start is greater than end
//  end = start
//  start = end
//  return the substring

// if start == end
//   return an empty string
//
// if end === undefined
//   end = string.length
// return substring from the start index to the end index:
// create new substring
// Loop from start index to end index
//  Add current character to substring
// return substring

function substring(string, start, end) {
  var substring = '';
  var temp;

  if (start > end) {
    temp = start;
    start = end;
    end = temp;
  }

  if (start < 0 || typeof start != 'number') {
    start = 0;
  }

  if (start === end) {
    return '';
  }

  if (start > string.length) {
    start = string.length;
  }

  if (end === undefined) {
    end = string.length;
  }

  if (end < 0 || typeof end != 'number') {
    end = 0;
  }

  if (end > string.length) {
    end = string.length;
  }

  for (var i = start; i < end; i++) {
    substring += string[i];
  }

  return substring;
}

var string = 'hello world';

console.log(substring(string, 2, 4));    // "ll"
console.log(substring(string, 4, 2));    // "ll"
console.log(substring(string, 0, -1));   // ""
console.log(substring(string, 2));       // "llo world"
console.log(substring(string, 'a'));     // "hello world"
console.log(substring(string, 8, 20));   // "rld"
