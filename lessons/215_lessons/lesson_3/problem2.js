// Problem Description
// The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers or Canadian Social Insurance Numbers.

// The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

// Counting from the rightmost digit and moving left, double the value of every second digit
// For any digit that thus become 10 or more, subtract 9 from the result
// 1111 becomes 2121
// 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
// Add all these digits together
// 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
// 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20
// If the total (the checksum) ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

// Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.

// "2323 2005 7766 3554" -> '2323200577663554'

// Input: A string
// - Ignore all non-numeric characters

// Output: Boolean, representing whether the number is valid according to the Luhn formula

// Counting from the rightmost digit and moving left, double the value of every second digit
// For any digit that thus become 10 or more, subtract 9 from the result
// 1111 becomes 2121
// 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
// Add all these digits together
// 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
// 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20
// If the total (the checksum) ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

// Rules for Luhn formula (Moving from rightmost digit to left)
// 1. Double every second digit
// 2. If result is >= 10, subtract 9 from result
// 3. Add all digits together
// 4. If sum % 10 === 0, then the number is valid
// 5. Else, number is not valid

// Shape of the problem:
// -Transform the string input into an array, so we can transform, and reduce elements to a single number

// Examples:
// 1111 -> 1 1 1 1
// 1
// 2
// 1
// 2 -> 2121 = 2 + 1 + 2 + 1 = 6
// 6 % 10 = 6
// Thus, number is not valid

// 8763 -> 8 7 6 3
// 3
// 12 - 9 = 3
// 7
// 16 - 9 = 7
// 7733 -> 7 + 7 + 3 + 3 = 20
// 20 % 10 = 0
// Thus, number is valid

// 0 -> Number is valid

// Edge cases:
// Empty string -> don't have to account for empty strings
// Can we assume that input will always be a string?

// Mental model:
// Given a string of digits, remove all non-numeric characters. Do rules for Luhn formula. If number is valid for Luhn formula, return true. Else, return false.

// Data Structure
// Strings -> an array, so we can transform and reduce to a single number

// Algorithm
// 1. Remove all non-numeric characters from string
// 3. Split string into an array of numbers
// 4. Reverse array
// 4. Map array:
// If current index is odd
//   Double digit
//   If result >= 10, element's value is result - 9
//   Else element's new value is result
// Else
//   Return current element
// 5. Reduce array: add all elements together in a sum
// 6. Return sum % 10 === 0

function isLuhnValid(number) {
  let numericChars = number.replace(/[^0-9]/g, '').split('').map(Number).reverse();

  let sum = numericChars.map(function(current, index) {
    if (index % 2 == 1) {
      let doubled = current * 2;
      if (doubled >= 10) {
        return doubled - 9;
      } else {
        return doubled;
      }
    } else {
      return current;
    }
  }).reduce(function(sum, current) {
    return sum + current;
  });

  return sum % 10 === 0;
}

// Examples:
console.log(isLuhnValid('1111')); // false
console.log(isLuhnValid('8763')); // true
console.log(isLuhnValid('0')); // true
console.log(isLuhnValid("2323 2005 7766 3554")); // true
console.log(isLuhnValid('2323 2005  #$@$@$$@ 7766 3554')); // true
console.log(isLuhnValid('876387638763')); // true
console.log(isLuhnValid('876-38763-8763')); // true
console.log(isLuhnValid('7767')); // false
console.log(isLuhnValid("2323 2005 7766 355"));
console.log(isLuhnValid('876'));

// Given a card number, if the card number is invalid according to the Luhn checksum, return number + number that will make the card number valid. If the number is valid, return the number.

// "2323 2005 7766 355" -> "2323 2005 7766 3554"
// "2323 2005 7766 3554" -> "2323 2005 7766 3554"

// Input: a card number represented as a string
// Output: a card number represented as a string
// - Same number if the card number is valid through Luhn formula
// - Number + check if the card number is not a valid number through the Luhn checksum

// If the number is invalid, we are only missing one number. That number has to be a number between 0 and 9.

// Algorithm:
// 1. If number is valid
// 2.  return number
// 3. Else
// 4.  Loop from 0 to 9
// 5.    Add current number to end of number
// 6.    Return number + current number if it's valid per the luhn algorithm

// Examples:
// fullCardNumber("2323 2005 7766 355"); // "2323 2005 7766 3554"
// fullCardNumber("2323 2005 7766 3554"); // "2323 2005 7766 3554"
// fullCardNumber('876') // 8763

function fullCardNumber(number) {
  if (isLuhnValid(number)) {
    return number;
  }

  for (let i = 0; i <= 9; i += 1) {
    let potentialNumber = number + String(i);

    if (isLuhnValid(potentialNumber)) {
      return potentialNumber;
    }
  }
}

console.log(fullCardNumber("2323 2005 7766 355")); // "2323 2005 7766 3554"
console.log(fullCardNumber("2323 2005 7766 3554")); // "2323 2005 7766 3554"
console.log(fullCardNumber('876')); // 8763
console.log(fullCardNumber('7767')); // 77677
console.log(fullCardNumber('1111')); // 11114
console.log(fullCardNumber('2324')); // 23242
