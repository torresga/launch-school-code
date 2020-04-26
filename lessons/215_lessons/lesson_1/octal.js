// Practice Problem: Octal
// Write a Function named octalToDecimal that performs octal to decimal conversion. When invoked on a String that contains the representation of an octal number, the Function returns a decimal version of that value as a Number. Implement the conversion yourself: do not use something else to perform the conversion for you.

// Input: A number as a string
// Output: A number of the Number type

// Rules:
// - implement the conversion yourself
// - input number is a string, string represents a number in octal
// - to convert a number: multiply digit by 8**place, from right to left, and exponent starts at 0
// - we can split number into an array

// Algorithm
// 1. Split string into an array
// 2. Reverse array
// 3. Map array
//  Turn element into a number
//  Return value for each element is element * 8**(current index)
// 4. Reduce array to one number

function octalToDecimal(numberString) {
  let number = numberString.split('').reverse();

  return number.map(function(digit, index) {
                  return Number(digit) * 8**index; })
               .reduce(function(sum, element) {
                  return sum + element;
               });
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
