// Double Doubles
// A double number is an even-length number whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, and 7676 are all double numbers, whereas 444, 334433, and 107 are not.
//
// Write a function that returns the number provided as an argument multiplied by two, unless the argument is a double number; return double numbers as-is.
//
//
// Input: An integer
// Output: An integer
//
// Rules
// - double numbers are an even length and the number's digits are the same on the left as they are on the right

// Algorithm
// Turn number into a string
// If number's length is even
//   Split number in half
//   If first half equals second half
//     Return Number
//
// Return number * 2

function twice(number) {
  var numberAsString = String(number);
  var half;
  var first;
  var second;

  if (numberAsString.length % 2 === 0) {
    half = numberAsString.length / 2;
    first = numberAsString.slice(0, half);
    second = numberAsString.slice(half);

    if (first === second) {
      return number;
    }
  }

  return number * 2;
}

// Examples:

console.log(twice(37));          // 74
console.log(twice(44));          // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676
