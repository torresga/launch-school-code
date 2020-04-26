// Problem Description
// Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

// The rules are as follows:

// If the phone number is less than 10 digits, assume that it is a bad number.
// If the phone number is 10 digits, assume that it is good.
// If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// If the phone number is more than 11 digits, assume that it is a bad number.
// For bad numbers, just a return a string of 10 0s.

// P- Understanding the Problem

// Input:
// - A string representing a phone number
// - String may contain numeric digits and special characters (spaces, dashes, dots, and parentheses)

// Output:
// - A string of digits
//   - What kind of digits it outputs depends on whether the number is bad or not:
//     - If the number is bad, return a string of 10 0s.
//     - If the number is good:
//       - If number is 11 digits and the first number is 1, return the last 10 digits
//       - If the number has 10 digits, return the digits

// Rules

// What about other characters that are not the special characters above that are not digits? (ex a, b, c)
// - Let's assume that characters that are not digits or spaces, dashes, dots, and parentheses indicate a bad number

// What is considered a bad number?
// - when it has less than 10 digits
// - when it has 11 digits and the first number is not 1
// - when the phone number is more than 11 digits

// What is considered a good number?
// - has 10 digits
// - has 11 digits and the first number is 1

// Mental model
// Given a number, remove any characters that are spaces, dashes, dots, or parentheses. If the number is bad, return a string of 10 0's. If the number is good, return either the last 10 digits, or all of the digits, depending on the length of the input.

// Examples (Determining what is a valid number)
// 1. A number that has less than 10 digits
// Input: '123456789'
// Output: false

// 2. A Number that has 11 digits and the first number is not 1
// Input: '22345678910'
// Output: false

// 3. A number that has more than 11 digits
// Input: '1234567891012'
// Output: false

// 4. A number that has 10 digits
// Input: '1234567891'
// Output: true

// 5. A number that has 11 digits and the first number is 1
// Input: '12345678910'
// Output: true

// 9. A string that contains spaces
// Input: '123 4567 891'
// Output: true

// 10. A string that contains dashes
// Input: '123-456-7891'
// Output: true

// 11. A string that contains parentheses
// Input: '(123)4567891'
// Output: true

// Edges cases:
// 6. A empty string input
// Input: ''
// Output: false

// 7. A string that has letters or other symbols
// Input: '123$36*()'
// Output: false

// 8. A non-string
// Input: 123456
// Output: false

// Data Structure
// Strings
// - thats our input
// - We can use regex
// - can use string methods like length and slice

// Algorithm:
// 0. return false if number is not a string
// 1. Remove spaces, dashes, dots, and parentheses from input
    // - .replace(/[()-\s\.]/g, '');
// 2. Determine whether number is valid
// 3. Return a string based on validity of number
    // If number is valid
    //   If number has 11 digits
    //     Return the last 10 digits
    //   Else
    //     Return all the digits
    // Else
    //   Return a string of 10 0s'

function cleanUpNumber(number) {
  let cleaned = number.toString().replace(/[^0-9]/g, '');

  if (isValidNumber(cleaned)) {
    if (cleaned.length === 11) {
      return cleaned.slice(1);
    }

    return cleaned;
  }

  return '0'.repeat(10);
}

// 1. A number that has less than 10 digits
console.log(cleanUpNumber('123456789'));
// '0000000000'

// 2. A Number that has 11 digits and the first number is not 1
console.log(cleanUpNumber('22345678910'));
// '0000000000'

// 3. A number that has more than 11 digits
console.log(cleanUpNumber('1234567891012'));
// '0000000000'

// 4. A number that has 10 digits
console.log(cleanUpNumber('1234567891'));
// '1234567891'

// 5. A number that has 11 digits and the first number is 1
console.log(cleanUpNumber('12345678910'));
// '2345678910'

// 6. A empty string input
console.log(cleanUpNumber(''));
// '0000000000'

// 7. A string that has letters or other symbols
console.log(cleanUpNumber('123$36*()'));
// '0000000000'

// 8. A non-string
console.log(cleanUpNumber(123456));
// '0000000000'

// 9. A string that contains spaces
console.log(cleanUpNumber('123 4567 891')); // 1234567891

// 10. A string that contains dashes
console.log(cleanUpNumber('123-456-7891'));
// 1234567891

// 11. A string that contains parentheses
console.log(cleanUpNumber('(123)4567891'));
// 1234567891


// 2. Determine whether number is valid (isValidNumber):
// Input: A string representing a number
// Output: a boolean
// 1. If number's length === 10 or if number's length is 11 and number[0] === '1'
// 2.  Return true
// 3. Else
// 4.  Return false

function isValidNumber(number) {
  if ((number.length === 10) || (number.length === 11 && number[0] === '1')) {
    return true;
  }

  return false;
}

console.log(cleanUpNumber('1234567894s')); //-> should have this test case, missed numbers that had letters in it. Changed regex to update this
