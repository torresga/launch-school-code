// myBind() Improved
// Our earlier implementation of the Function.prototype.bind was simplistic. Function.prototype.bind has another trick up its sleeve besides hard-binding functions to context objects. It's called partial function application. Read this assignment and the MDN documentation to learn more about partial function application.
//
// Alter the myBind function written in the previous exercise to support partial function application.

function myBind(func, context) {
  // can take 1 or more arguments here
  // Get the last argument here
  var startingVal = Array.prototype.slice.call(arguments).slice(2);

  return function() {
    // Get the other args from here
    var otherArgs = Array.prototype.slice.call(arguments);
    return func.apply(context, startingVal.concat(otherArgs));
  };
}

function list() {
  return Array.prototype.slice.call(arguments);
}

const leadingThirtysevenList = myBind(list, null, 37);

const list2 = leadingThirtysevenList();
console.log(list2);
//  [37]

const list3 = leadingThirtysevenList(1, 2, 3);
console.log(list3); // [37, 1, 2, 3]

function addNumbers(a, b) {
  return a + b;
}

var addFive = myBind(addNumbers, null, 5);

console.log(addFive(10)); // 15
