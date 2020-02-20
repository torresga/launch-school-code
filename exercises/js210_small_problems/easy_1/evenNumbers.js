// Even Numbers
// Log all even numbers from 1 to 99, inclusive, to the console. Log all numbers on separate lines.

// Input: None
// Output: All even numbers from 1 to 99 inclusive.

// Algorithm
// Create variable currentNumber and assign it to 1
// Loop while currentNumber < 100
//   Output currentNumber if currentNumber has a remainder of 0 when divided by 2
//   Add 1 to currentNumber

for (var currentNumber = 1; currentNumber < 100; currentNumber += 1) {
  if (currentNumber % 2 === 0) {
    console.log(currentNumber);
  }
}
