// 1. What naming convention separates constructor functions from other functions?
// Capitalizing the first letter in the constructor function's name.

// 2. What will the code below output? Why?

// function Lizard() {
//   this.scamper = function() {
//     console.log("I'm scampering!");
//   };
// }
//
// var lizzy = Lizard();
// lizzy.scamper(); // ?  TypeError - Cannot read property 'scamper' of undefined
// Lizard does not return an object, so it's return value is undefined
// this.scamper is a property set on the global object
// since 'lizzy' does not contain the global object, 'scamper' cannot be called on it.
// 'lizzy' is undefined, and undefined does not have a property called 'scamper'

// 3. Alter the code in problem 2 so that it produces the desired output.

function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy =  new Lizard();
lizzy.scamper();
