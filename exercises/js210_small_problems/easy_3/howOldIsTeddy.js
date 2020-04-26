// How Old is Teddy
// Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between 20 and 200 (inclusive).

// Input: None
// Output: A string containing a random number
//
// Data Structures
// Numbers
//
// Algorithm
// 1. Randomly generate number between 20 and 200 inclusive
// 2. Log output: 'Teddy is ' + number + years old!

// Example Output:

// Teddy is 69 years old!

function getRandomInclusive(min, max) {
  var temp;

  if (min > max) {
    temp = min;
    min = max;
    max = temp;
  }

  return Math.floor(Math.random() * (max - min + 1)) + min;
}

console.log('Teddy is ' + Number(getRandomInclusive(20, 200)) + ' years old!');

// Further Exploration
// The randomBetween function used the Math.floor() method. Would it make a difference if the Math.round() method was used instead?
// I think if Math.round() was used it would make the number potentially larger than between 20 and 200.
//
// Also, how can we make the function more robust? What if the user inadvertently gave the inputs in reverse order (i.e., the value passed to min was greater than max)?
