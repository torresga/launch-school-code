// Convert a String to a Number
// For this exercise we're going to learn more about type conversion by implementing our own parseInt function that converts a string of numeric characters (including an optional plus or minus sign) to a number.
//
// The function takes a string of digits as an argument, and returns the appropriate number. Do not use any of the built-in functions for converting a string to a number type.
//
// For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

// Input: A string of digits
// Output: The appropriate number as a Number
//
// Do not use Number() or parseInt
// We can use type coercion to turn a string into a number
// Concat won't work, because it coerces two primitives into strings, but we can use the muliplication operator to turn a string into a number

function stringToInteger(str) {
  return str * 1;
}

// Examples:

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570
