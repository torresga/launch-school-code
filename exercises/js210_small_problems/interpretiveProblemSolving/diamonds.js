// Diamonds
// Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

// PEDAC Process

// Input: an odd integer
// - can assume that this argument will always be an odd integer

// Output: a diamond
// - diamond's height will be n (odd integer) rows long
// - diamond's width will be n (odd integers) rows wide

// Rules:
// - *'s will be used to create diamond
// - Middle (widest point) of diamond will be n *'s wide
// - Other lines of diamond will be (n - current row) stars wide
// - Diamond rows begin at 1
// - each row has an odd number of stars
// - Each row follows a pattern - rows 1 up to (but not including the widest point of the diamond) are (row number) + (row number - 1) stars and
// - There are (n - (row number) + (row number - 1)) spaces total. Divide that number in 2 to get the number of spaces on each side.

// Mental model: Create a string. Create n number of rows, from 1 to n. Create an odd number of stars for each row. Add (n - odd number of stars) / 2 spaces on each end. Return a new string.

// Edge cases:
// - What about 0 and negative input? Will output an empty string.

// Data Structures
// Create an array to hold each row of the diamond. Each element is a string.

// Algorithm
// 1. Create a new array to hold diamond lines
// 2. Loop from 1 to (n / 2) floor times
// 3.    Create string with the current number of stars
// 4.    Add string to new array
// 5. Create string with n stars
// 6. Loop from (n / 2) floor times down to 1
// 7.  Create string with current number of stars
// 8.  Add string to new array

// 9. Loop through the new array
// 10.  Output each row of the stars

// Create string with the current number of stars:
// 1. Create a new string
// 2. Loop current number of times
// 3. Add '*' to new string
// 4. Return new string
function symbolString(number, sym) {
  if (number < 0) return '';

  return sym.repeat(number);
}

function diamond(widest) {
  let rows = [];

  for (let i = 1; i <= Math.floor(widest / 2); i += 1) {
    let numberOfSpaces = (widest - (i + (i - 1))) / 2;
    let numberOfStars = i + (i - 1);
    let currentString = symbolString(numberOfSpaces, ' ') + symbolString(numberOfStars, '*') + symbolString(numberOfSpaces, ' ');
    rows.push(currentString);
  }

  rows.push(symbolString(widest, '*'));

  for (let i = Math.floor(widest / 2); i >= 1; i -= 1) {
    let numberOfSpaces = (widest - (i + (i - 1))) / 2;
    let numberOfStars = i + (i - 1);
    let currentString = symbolString(numberOfSpaces, ' ') + symbolString(numberOfStars, '*') + symbolString(numberOfSpaces, ' ');
    rows.push(currentString);
  }

  rows.forEach(function(row) {
    console.log(row);
  });
}
// Examples:

diamond(1);
// logs
// *
diamond(3);
// logs
//  *
// ***
//  *

diamond(9);
// logs
//     * - 1 + 0
//    *** - 2 + 1
//   ***** - 3 + 2
//  ******* - 4 + 3
// ********* - 9
//  ******* - 4 + 3
//   ***** - 3 + 2
//    *** - 2 + 1
//     * - 1 + 0

diamond(-1);

diamond(0);
