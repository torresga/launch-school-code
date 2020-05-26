// 1. Write a function named greet that takes two arguments and logs a greeting:

greet('howdy', 'Joe');
// Howdy, Joe!
greet('good morning', 'Sue');
// Good morning, Sue!

function greet(salutation, name) {
  var greeting = salutation[0].toUpperCase() + salutation.slice(1) + ', ' + name + '!';
  console.log(greeting);
}

// 2. Use the partial function shown above and your solution to problem 1 to create sayHello and sayHi functions that work like this:

function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  }
}

var sayHello = partial(greet, 'hello');
var sayHi = partial(greet, 'hi');

sayHello('Brandon');
// Hello, Brandon!
sayHi('Sarah');
// Hi, Sarah!
