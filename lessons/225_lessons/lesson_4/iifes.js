// 1. Will the code below execute?

// function() {
//   console.log("Sometimes, syntax isn't intuitive!")
// }();

// No, because the function needs to be surrounded by parentheses.

// 2. Edit the code from problem one so it executes without error.
(function() {
  console.log("Sometimes, syntax isn't intuitive!")
})();

// 3. The code below throws an error:

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);  // ?

console.log(sum);

// What kind of problem does this error highlight? Use an IIFE to address it, so that code runs without error.
// Get a TypeError: sum is not a function. Hoisting makes sure that the function sum is at the top. Then, sum is reassigned integer values on lines 1, 4, 5. On line 16, sum is added to the return value of sum, but sum is not a function anymore. We can assign the return value of an IIFE to sum and output that value.

// 4. Consider the output below:

// countdown(7);
// 7
// 6
// 5
// 4
// 3
// 2
// 1
// 0
// Done!
// Implement a function countdown that uses an IIFE to generate the desired output.

function countdown(count) {
  (function(number) {
    for (var i = number; i >= 0; i -= 1) {
      console.log(i);
    }

    console.log('Done!');
  })(count);
}

countdown(7);

// 5. Is the named function in this IIFE accessible in the global scope?

(function foo() {
  console.log('Bar');
})();

// foo() // ? No, the IIFE creates a new scope that is not accessible from the global scope.

// 6. For an extra challenge, refactor the solution to problem 4 using recursion, bearing in mind that a named function created in an IIFE can be referenced inside of the IIFE.

function countdown(count) {
  (function blastOff(currentNumber) {
    if (currentNumber === 0) {
      console.log(0);
      console.log('Done!');
      return 0;
    } else {
      console.log(currentNumber);
      return blastOff(currentNumber - 1);
    }
  })(count);
}

countdown(7);
