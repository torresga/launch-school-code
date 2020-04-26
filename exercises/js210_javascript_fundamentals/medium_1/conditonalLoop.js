// Conditional Loop
// The following program is expected to log each number between 0 and 9 (inclusive) that is a multiple of 3. Read through the code shown below. Will it produce the expected result? Why or why not?

var i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}

// This will produce an infinite loop. i is not increased by 1 because i is only increased by 1 in the else branch.

// i starts out as 0, and 0 % 3 === 0 is true

// i will never increase, therefore (i % 3 === 0) will always be true and i will always output to the screen.
