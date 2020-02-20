// ASCII String Value
// Write a function that determines and returns the ASCII string value of a string passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String.prototype.charCodeAt() to determine the ASCII value of a character.)

// Input: A string
// Output: An integer representing the sum of each ASCII code in the string

// Algorithm
// Return 0 if the input string is empty.
// Create a variable to hold sumOfAsciiChars and assign it to 0
// Loop over each character
//  Add Ascii value of each cahracter to the sum
// Return sum

function asciiValue(string) {
  var sumOfAsciiChars = 0;
  var i;
  for (i = 0; i < string.length; i += 1) {
    sumOfAsciiChars += string.charCodeAt(i);
  }

  return sumOfAsciiChars;
}

// Examples:

console.log(asciiValue('Four score'));         // 984
console.log(asciiValue('Launch School'));      // 1251
console.log(asciiValue('a'));                  // 97
console.log(asciiValue(''));                   // 0
