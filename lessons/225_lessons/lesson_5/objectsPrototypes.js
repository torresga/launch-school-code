// 1. Use the method we learned above to assign foo below to a new Object with prot as its prototype.

var prot = {};

var foo = Object.create(prot);

// 2. Use getPrototypeOf to demonstrate the prototypal relationship between prot and foo.

console.log(Object.getPrototypeOf(foo) === prot);

// 3. Use isPrototypeOf to demonstrate the prototypal relationship between prot and foo.

console.log(prot.isPrototypeOf(foo));

// 4. What will the last two lines of the code below return? Why?

var prot = {};

var foo = Object.create(prot);

console.log(prot.isPrototypeOf(foo)); // true because prot is the prototype of foo
console.log(Object.prototype.isPrototypeOf(foo)); // this is true because Object.prototype is the top of the prototype chain, and foo's prototype is prot and prot's prototype is Object.prototype, therefore foo's prototype is Object.prototype
