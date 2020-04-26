// Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

// The rules are as follows:

// If the phone number is less than 10 digits, assume that it is a bad number.
// If the phone number is 10 digits, assume that it is good.
// If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// If the phone number is more than 11 digits, assume that it is a bad number.
// For bad numbers, just a return a string of 10 0s.

// Input: Our input is a phone number represented as a String - because it might contain special characters such as spaces, dash, dot, and parentheses
// Output: A string representing a valid phone number

// Cleaning up phone numbers

// Rules for determining whether number is bad:
// - if phone number's length is less than 10, it is a bad number (return a string of 10 0s).
// - if phone number's length is 10, it is a good number
// - if phone number's length is 11 and first character is 1, trim 1 and use last 10 characters
// - if phone number's length is 11 and first character is not 1, then it is a bad number (return a string of 10 0's).
// - if phone number's length is more than 11, it is a bad number (return a string of 10 0's )
// - for bad number's return a string of 10 0's.

// - First number doesn't have to be 1

// clean up the number (removing special characters such as spaces, dashes, dots, and parentheses)

// If number is bad
//   return a string of 10 0's
// Else (if number is valid)
//   return the number

// Examples:

// Test case 1 - number less than 10 digits
// cleanUpNumber('123456789') // '0000000000'
// Test case 2 - number that is 10 digits (one number that is just 10 digits, and another number that is 10 digits but with special characters)
// cleanUpNumber('1234567890') // '1234567890'
// cleanUpNumber('123 456789') // '0000000000'
// cleanUpNumber('(555) 555-5555') // '5555555555'
// cleanUpNumber('123.456.7890') // '1234567890'
// Test case 3 - number that is 11 digits (1 test case where the first number is 1, 1 test case where the first number is not 1)
// cleanUpNumber('12345678901') // '2345678901'
// cleanUpNumber('23456789012') // '0000000000'
// Test case 4 - Phone number that has more than 11 digits
// cleanUpNumber('234583989458938934') // '0000000000'
// Test case 5 - Phone number that just consists of special characters
// cleanUpNumber('() -.     ()') // '0000000000'

// Data Structure



// Algorithm

// Problem 1: clean up the number (removing special characters such as spaces, dashes, dots, and parentheses)

// Ways to clean up a number:
// - Use a regex and clean up every part of the number at once

// Use .replace to replace ' ' with '' - use regex
// replace '-' with ''
// replace '.' with ''
// replace ''
// .replace(/[-()\. ]/g, '');

// Input: A number represented by a string
// Output: A string, with special characters removed
function removeSpecialCharacters(phoneNumber) {
  return phoneNumber.replace(/[-()\. ]/g, '');
}

console.log(removeSpecialCharacters('123 456789'));
console.log(removeSpecialCharacters('(555) 555-5555'));
console.log(removeSpecialCharacters('123.456.7890'));
console.log(removeSpecialCharacters('() -.     ()')); // ''

// Problem 2: Determining whether the number is bad
// (isBadNumber)
// Input: A string representing a number
// Output: A boolean

// Rules for determining whether number is bad:
// - if phone number's length is less than 10, it is a bad number (return a string of 10 0s).
// - if phone number's length is 10, it is a good number
// - if phone number's length is 11 and first character is 1, trim 1 and use last 10 characters
// - if phone number's length is 11 and first character is not 1, then it is a bad number (return a string of 10 0's).
// - if phone number's length is more than 11, it is a bad number (return a string of 10 0's )
// - for bad number's return a string of 10 0's.

// If number's length is < 10
//   Return true
// If number's length === 11 and number[0] == '1'
//   Return false
// If number's length ==== 11 and number[0] !== '1'
//   Return true
// If number's length > 11
//   Return true
// Else
//   Return false

function isBadNumber(phoneNumber) {
  if (phoneNumber.length < 10) {
    return true;
  } else if (phoneNumber.length === 11 && phoneNumber[0] === '1') {
    return false;
  } else if (phoneNumber.length === 11 && phoneNumber[0] !== '1') {
    return true;
  } else if (phoneNumber.length > 11) {
    return true;
  } else {
    return false;
  }
}

function isValidPhoneNumber(num) {
  return /^1?(\d){10}$/.test(num);
}

console.log(isBadNumber('123456789')); // true
console.log(isBadNumber('12345678901')); // false
console.log(isBadNumber('1234567890')); // false
console.log(isBadNumber('23456789012')); // true
console.log(isBadNumber('234583989458938934')); // true

// Clean up number
// If number is bad
//   return a string of 10 0's
// If number is good and number length is 11
  // Return a slice of number (starting at 1)
// Else
//   return the number

// Code

function cleanUpNumber(number) {
  let phoneNumber = removeSpecialCharacters(number);

  if (isBadNumber(phoneNumber)) {
    console.log('0'.repeat(10));
  } else if (phoneNumber.length === 11) {
    console.log(phoneNumber.slice(1));
  } else {
    console.log(phoneNumber);
  }
}

// Test case 1 - number less than 10 digits
cleanUpNumber('123456789') // '0000000000'
// Test case 2 - number that is 10 digits (one number that is just 10 digits, and another number that is 10 digits but with special characters)
cleanUpNumber('1234567890') // '1234567890'
cleanUpNumber('123 456789') // '0000000000'
cleanUpNumber('(555) 555-5555') // '5555555555'
cleanUpNumber('123.456.7890') // '1234567890'
// Test case 3 - number that is 11 digits (1 test case where the first number is 1, 1 test case where the first number is not 1)
cleanUpNumber('12345678901') // '2345678901'
cleanUpNumber('23456789012') // '0000000000'
// Test case 4 - Phone number that has more than 11 digits
cleanUpNumber('234583989458938934') // '0000000000'
// Test case 5 - Phone number that just consists of special characters
cleanUpNumber('() -.     ()') // '0000000000'
