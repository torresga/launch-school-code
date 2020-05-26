// 1. What does the following code log to the console?

var a = 1;
var foo;
var obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo(); // outputs 2 because `this` refers to the object created by 'new'

foo.bar(); // outputs 2 because `this` refers to the object created by 'new'
Foo(); // outputs 2. reassigns the global object's property 'a' to 2

obj = {};
Foo.call(obj); // calling Foo with the context of obj - it sets obj's peroperty 'a' to 2 and creates a method 'bar'. outputs 2
obj.bar(); // outputs 2 because `this` refers to obj, which has the property a that was assigned the value 2 on line 21.
//
console.log(this.a); // outputs 2, a was reassigned when Foo was executed.

// 2. What does the following code log to the console?

var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  perimeter: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area();
  this.perimeter = RECTANGLE.perimeter();
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area); // NaN because this.width and this.height are undefined
console.log(rect1.perimeter); // NaN because this.width and this.height are undefined

// RECTANGLE does not have properties `width` and `height`. They are considered undefined.

// How do you fix this problem?
// Remove the 'this' keyword from RECTANGLE and pass in this.height and this.width to area and perimeter
// OR JUST USE call WITH this AS A CONTEXT!!!!!

var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  perimeter: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.perimeter = RECTANGLE.perimeter.call(this);
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area);
console.log(rect1.perimeter);

// 3. Write a constructor function Circle, that takes a radius as an argument. You should be able to call an area method on the created objects to get the circle's area.

function Circle(radius) {
  this.radius = radius;

  this.area = function() {
    return Math.PI * (this.radius**2);
  }
}

// We could also do:
// Circle.prototype.area = function() {
//    return Math.PI * (this.radius**2);
// }

// Test your implementation with the following code:

var a = new Circle(3);
var b = new Circle(4);

console.log(a.area().toFixed(2)); // => 28.27
console.log(b.area().toFixed(2)); // => 50.27

// 4. What will the following code log out and why?

// var ninja;
// function Ninja() {
//   this.swung = true;
// }
//
// ninja = new Ninja();
//
// Ninja.prototype.swingSword = function() {
//   return this.swung;
// };
//
// console.log(ninja.swingSword()); // returns 'true'
// Ninja.prototype.swingSword creates a new method for each object of Ninja. 'this.swung' is assigned to true when each Ninja object is created. Therefore, swingSword() will return 'true' when it is called on the Ninja object held by the variable `ninja`. (answer says that the prototype chain lookup happens when swingSword is called.)

// 5. What will the following code log out and why?

// var ninja;
// function Ninja() {
//   this.swung = true;
// }
//
// ninja = new Ninja();
//
// Ninja.prototype = {
//   swingSword: function() {
//     return this.swung;
//   },
// };
//
// console.log(ninja.swingSword()); // Uncaught TypeError: swingSword is not a function.

 // Line 122 changes the prototype of Ninja to a new object (which is not the same object that is created and assigned to the prototype when a new Ninja object is created). This doesn't matter because ninja is assigned a new Ninja object on line 120, and therefore it doesn't have a swingSword function.

 // So I guess these two examples illustrate that changing the prototype of an object doesn't affect previously created objects, but we can modify methods on the prototype and that will affect previously created objects (as long as the previously created objects and newly created objects have the same prototype)

// 6. Implement the method described in the comments below:

// var ninjaA;
// var ninjaB;
// function Ninja() {
//   this.swung = false;
// }
//
// ninjaA = new Ninja();
// ninjaB = new Ninja();
//
// Ninja.prototype.swing = function() {
//   this.swung = true;
//
//   return this;
// }

// Add a swing method to the Ninja prototype which
// returns the calling object and modifies swung

// console.log(ninjaA.swing().swung);      // must log true
// console.log(ninjaB.swing().swung);      // must log true

// 7. In this problem, we'll ask you to create a new instance of an object, without having direct access to the constructor function:

var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

// create a ninjaB object
var ninjaB = Object.create(Object.getPrototypeOf(ninjaA));

console.log(ninjaB.constructor === ninjaA.constructor);    // should log true
