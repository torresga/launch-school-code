// Bannerizer
// Write a function that will take a short line of text, and write it to the console log within a box.

// parts of box:
// +-(- * length of string )-+
// | (' ' * length of string) |
// | (string) |
// | (' ' * length of string) |
// +-(- * length of string)-+

// Algorithm:
// Create a string to hold the dashes
// Create a string to hold the box padding
// Create a string to hold boxEdges
// Create a string to hold boxVerticalAndSidePadding
// Create a string to hold middle;
//
//
// Loop string.length times
//   dashes += '-'
//   padding += ' '
//
// Edge = '+-' + dashes + '-+'
// boxVerticalAndSidePadding = '| ' + padding + ' |'
// middle = '| ' + string + ' |'
//
// return edge + '\n' +
// boxVerticalAndSidePadding + '\n' +
// middle + '\n' +
// boxVerticalAndSidePadding + '\n' +
// edge

function logInBox(string) {
  var dashes = '';
  var padding = '';
  var boxEdges;
  var boxVerticalAndSidePadding;
  var middle;

  var i;
  for (i = 0; i < string.length; i += 1) {
    dashes += '-';
    padding += ' ';
  }

  boxEdges = '+-' + dashes + '-+';
  boxVerticalAndSidePadding = '| ' + padding + ' |';
  middle = '| ' + string + ' |';

  return boxEdges + '\n' +
  boxVerticalAndSidePadding + '\n' +
  middle + '\n' +
  boxVerticalAndSidePadding + '\n' +
  boxEdges;
}
// Examples:

console.log(logInBox('To boldly go where no one has gone before.'));
console.log(logInBox(''));
