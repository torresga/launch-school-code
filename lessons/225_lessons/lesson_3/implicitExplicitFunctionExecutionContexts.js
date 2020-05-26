// 1. What will the code below output?

function func() {
  return this;
}

var context = func();

console.log(context);

// This will output the Window object because the implicit context is the global object (in this case the Window).

// 2. What will the code below output? Explain the difference, if any, between this output and that of problem 1.

var o = {
  func: function() {
    return this;
  },
};

var context = o.func();

console.log(context);

// This will output the o object. On line 21, the func method is explicitly called by the o object.The difference between this problem and problem 1 is that `func` is a method of the `o` object.

// 3. What will the code below output?

var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage(); // 'Hello from the global scope!' because `this` refers to the global object. (because it is a function)

var foo = {
  message: 'Hello from the function scope!',
};

foo.deliverMessage = deliverMessage; // assigns the function on line 31 to a new method bound to 'foo' called 'deliverMessage'

foo.deliverMessage(); // 'Hello from the function scope!' because this's context changes to the object foo (because it is a method)

// 4. What will the code below output?

var a = 10;
var b = 10;
var c = {
  a: -10,
  b: -10,
};

function add() {
  return this.a + b; // this is a function, and `this` references the global object.
}

c.add = add; // `add` becomes a method of the object `c`. `this` inside the function now references the object 'c'

console.log(add()); // 20, because this.a is 10 and b is 10
console.log(c.add()); // this is 0 because this.a is -10 and then b is 10??

// 5. The problems above all feature implicit function execution context. What methods have we learned so far that allow us to explicitly specify what a function's execution context should be?

// call and apply

// 6. In the code below, use call to invoke add as a method on bar but with foo as execution context. What will this return?

var foo = {
  a: 1,
  b: 2,
};

var bar = {
   a: 'abc',
   b: 'def',
   add: function() {
     return this.a + this.b;
   },
};

bar.add.call(foo); // 3

// 7. Given the code and desired output below, would it make more sense to use call or apply to supply explicit context and arguments to outputList? Implement a solution using one of the methods, such that the desired output is logged, and explain your choice.

var fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};


function outputList() {
  console.log(this.title + ':');

  var args = [].slice.call(arguments);

  args.forEach(function(elem) {
    console.log(elem);
  });
}

// invoke outputList here
// use apply to pass in an array of arguments
outputList.apply(fruitsObj, fruitsObj.list);

// 8. For an extra challenge, consider this line of code from the previous problem:
//
// var args = [].slice.call(arguments);
// Inside of JavaScript functions, arguments is an object that holds all of the arguments passed to the function. Bearing in mind that the function author wants to iterate over the arguments later in the method using an Array method, why do you think he or she is invoking call?
// Because we cannot use the array method 'forEach' on the `arguments` object as is. We have to call slice on a new array with the contect of `arguments` (in this case, all the elements of the object) to create an array copy of the arguments list.
