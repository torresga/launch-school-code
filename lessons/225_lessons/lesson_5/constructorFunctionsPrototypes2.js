// 1. Follow the steps below:

// 1. Create an object called shape that has a getType method.
// 2. Define a Triangle constructor function whose prototype is shape. Objects created with Triangle should have four own properties: a, b, c (representing the sides of a triangle), and type.
// 3. Add a new method to the prototype called getPerimeter.
//

var shape = {
  getType: function() {
    return this.type;
  },
}

var Triangle = function(a, b, c) {
  this.a = a;
  this.b = b;
  this.c = c;
  this.type = 'triangle';
};

Triangle.prototype = shape;
Triangle.prototype.getPerimeter = function() {
  return (this.a + this.b + this.c);
};

// Forgot to set constructor
Triangle.prototype.constructor = Triangle;

// Test your implementation with the following code:

// var t = new Triangle(3, 4, 5);
// console.log(t.constructor);                 // Triangle(a, b, c)
// console.log(shape.isPrototypeOf(t));        // true
// console.log(t.getPerimeter());              // 12
// console.log(t.getType());                   // "triangle"

// 2. Since a constructor is just a function, it can be called without the new operator, and this can lead to unexpected results and errors especially for inexperienced programmers.
//
// Write a constructor function that can be used with or without the new operator, and return the same result in either form. Use the code below to check your solution:

function User(first, last) {
  this.name = first + ' ' + last;

// if this's constructor equals Object's constructor
//  create a new object and return that new object
// else
//  return this
  if (this.constructor === Object) {
    var newObj = Object.create(User.prototype);
    newObj.name = this.name;
    return newObj;
  }
}

var name = 'Jane Doe';
var user1 = new User('John', 'Doe');
var user2 = User('John', 'Doe');

console.log(name);         // => Jane Doe
console.log(user1);
console.log(user2);
console.log(user1.constructor);
console.log(user2.constructor);
console.log(user1.name);   // => John Doe
console.log(user2.name);   // => John Doe

// 3. Create a function that can create an object with a given object as its prototype, without using Object.create.

function createObject(obj) {
  // var newObj = new Object();
  // newObj.__proto__ = obj;
  // return newObj;

  var CreateNewObj = function() {};
  CreateNewObj.prototype = obj;

  return new CreateNewObj();
}

var foo = {
  a: 1
};

var bar = createObject(foo);

console.log(bar);
console.log(foo.isPrototypeOf(bar));         // true

// 4. Similar to the problem above, without using Object.create, create a begetObject method that you can call on any object to create an object inherited from it:

var foo = {
  a: 1,
};

Object.prototype.begetObject = function() {
  function CreateObj() {}

  CreateObj.prototype = this;

  return new CreateObj;
};

var bar = foo.begetObject();
console.log(foo.isPrototypeOf(bar));         // true

// 5. Create a function neww, so that it works like the new operator. For this practice problem, you may use Object.create.

function neww(constructor, args) {
  var newObj = Object.create(constructor.prototype);

  constructor.apply(newObj, args);

  return newObj;
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

var john = neww(Person, ['John', 'Doe']);
console.log(john);
john.greeting();          // => Hello, John Doe
console.log(john.constructor);         // Person(firstName, lastName) {...}
