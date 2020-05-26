// 1. What does this point to in the code below?

function whatIsMyContext() {
  return this;
}

// we don't know, because the context is gained at runtime

// 2. What does this point to in the code below?

function whatIsMyContext() {
  return this;
}

whatIsMyContext();

// The implicit global object (the Window in the case of a browser).

// 3. What does this point to in the code below?

function foo() {
  function bar() {
    function baz() {
      console.log(this);
    }

    baz();
  }

  bar();
}

foo();

// The implicit global object (Window), because function calls set the execution context to the implicit global object.

// 4. What does this point to in the code below?

var obj = {
  count: 2,
  method: function() {
    return this.count;
  },
};

obj.method();

// The object `obj`, because methods implicitly set the execution context to its' calling object.

// 5. What does the following program log to the console?

function foo() {
  console.log(this.a);
}

var a = 2;
foo();
// logs 2 because this.a refers to the variable `a` defined outside of foo(). this refers to the Window object.

// 6. What does the following program log to the console?

var a = 1;
function bar() {
  console.log(this.a);
}

var obj = {
  a: 2,
  foo: bar,
};

obj.foo();

// same as:
function bar() {
  console.log(this.a);
}
var a;
var obj;

a = 1;
obj = {
  a: 2,
  foo: bar,
};

obj.foo(); // 2 because when foo is invoked, `this` refers to the calling object (obj).

// 7. What does the following code log to the console?

var foo = {
  a: 1,
  bar: function() {
    console.log(this.baz());
  },

  baz: function() {
    return this;
  },
};

foo.bar(); // the foo object
var qux = foo.bar;
qux(); // Uncaught TypeError this.baz is not a function, since in this context, `this` refers to the global object (Window) 
