// Multiples of 3 and 5
// Write a function that logs the integers from 1 to 100 (inclusive) that are multiples of either 3 or 5. If the number is divisible by both 3 and 5, append an "!" to the number.
//
// Example
// multiplesOfThreeAndFive();
//
// // output on console
// '3'
// '5'
// '6'
// '9'
// '10'
// '12'
// '15!'
// // ... remainder of output omitted for brevity

// PEDAC:
//
// Understanding the Problem:
//
// Input: None
// Output: A multiple of 3 and/or 5 from 1 to 100.
//
// Algorithm

// 1. Loop from 1 to 100
// 2.  If current number is divisible by 3 and 5
// 3.    Log number and add '!'
// 4.  Else if number is only divisible by 3 or 5
// 5.    Log number

function multiplesOfThreeAndFive() {
  for (var i = 1; i <= 100; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log((i).toString() + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log((i).toString());
    }
  }
}

multiplesOfThreeAndFive();

// For additional practice, how would you change your function so it takes, as arguments, the range of numbers it should check?

function multiplesOfThreeAndFive(min, max) {
  for (var i = min; i <= max; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log((i).toString() + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log((i).toString());
    }
  }
}

multiplesOfThreeAndFive(3, 99);
