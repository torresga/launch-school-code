// 1. Write a function named makeMultipleLister that, when invoked and passed a number, returns a function that logs every positive integer multiple of that number less than 100. Usage looks like this:

var lister = makeMultipleLister(13);
lister();
// 13
// 26
// 39
// 52
// 65
// 78
// 91

function makeMultipleLister(number) {
  return function() {
    // log every positive integer multiple of that number less than 100
    // loop from number to 100 non-inclusive
    //  log current number if current number is a multiple of number

    for (let i = number; i < 100; i += 1) {
      if (i % number === 0) {
        console.log(i);
      }
    }
  };
}

// 2. Write a program that uses two functions, add and subtract, to manipulate a running total value. When you invoke either function with a number, it should add or subtract that number from the running total and log the new total to the console.

var total = 0;

function add(number) {
  total += number;
  return total;
}

function subtract(number) {
  total -= number;
  return total;
}

// Usage looks like this:

console.log(add(1));
// 1
console.log(add(42));
// 43
console.log(subtract(39));
// 4
console.log(add(6));
// 10

// 3. Write a function named later that takes two arguments: a function and an argument for that function. The return value should be a new function that calls the input function with the provided argument, like this:

var logWarning = later(console.log, 'The system is shutting down!');
logWarning();
// The system is shutting down!

function later(func, arg) {
  return function() {
    func(arg);
  };
}

// 4. Given the following code:

function startup() {
  var status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

var ready = startup();
var systemStatus = // ?
// How can you set the value of systemStatus to the value of the inner variable status without changing startup in any way?
// You can't. status is not accessible outside of the function startup.
