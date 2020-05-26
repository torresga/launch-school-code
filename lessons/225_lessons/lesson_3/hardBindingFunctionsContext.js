// 1. What function can we use to permanently bind a function to a particular execution context?
// bind

// 2. What will the code below log to console?

var obj = {
  message: 'JavaScript',
};

function foo() {
  console.log(this.message);
}

foo.bind(obj);

// nothing

// 3. What will the code below output?

var a = 1;
var b = -1;
var obj = {
  a: 2,
  b: 3,
};

function foo() {
  return this.a + this.b;
}

var bar = foo.bind(obj);

console.log(foo()); // 0 - context is global object
console.log(bar()); // 5 - context is obj

// 4. What will the code below log to the console?

var positiveMentality = {
  message: 'JavaScript makes sense!',
};

var negativeMentality = {
  message: 'JavaScript makes no sense!',
};

function foo() {
  console.log(this.message);
}

var bar = foo.bind(positiveMentality); // returns a new function that has the context of positiveMentality

negativeMentality.logMessage = bar; // a new method for the object negativeMentality is created and assigned to the function stored in bar
negativeMentality.logMessage(); // 'JavaScript makes sense!'

// 5. What will the code below output?

var obj = {
  a: 'Amazebulous!',
};
var otherObj = {
  a: "That's not a real word!",
};

function foo() {
  console.log(this.a);
}

var bar = foo.bind(obj); // returns a new object that has the context of obj

bar.call(otherObj); // 'Amazebulous' because bind uses the context of its' argument permanently.
