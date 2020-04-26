// Right Triangles
// Write a function that takes a positive integer, n, as an argument, and logs a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

// Input: A positive integer
// Output: a right triangle whose sides have input number of stars

// Spaces come first. Spaces + *'s equal input length

// How do we get more than one space in a row if we don't have multoplication method? Use loops
// nChars: input is character, number of character
// Create a new variable to hold the string
// Loop from 1 to number of character
//   Add to string the current character
//
// Return string


// Algorithm
// Create a new variable to hold the triangle string
// Loop n times
//  Add spaces + stars + '\n' to string
// Return string

function nChars(character, times) {
  var str = '';

  var i;
  for (i = 1; i <= times; i += 1) {
    str += character;
  }

  return str;
}

function triangle(width) {
  var triangle = '';

  var i;
  for (i = 1; i <= width; i += 1) {
    triangle += nChars(' ', width - i) + nChars('*', i) + '\n';
  }

  return triangle;
}

// Examples:

console.log(triangle(5));
//
//     *
//    **
//   ***
//  ****
// *****
//
console.log(triangle(9));
//
//         *
//        **
//       ***
//      ****
//     *****
//    ******
//   *******
//  ********
// *********
