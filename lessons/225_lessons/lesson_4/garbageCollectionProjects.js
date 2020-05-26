// 1. Is JavaScript a garbage-collected language, and if so, what does this entail?

// JavaScript is a garbage-collected language and this entails that the JavaScript interpreter assigns memory, manages memory, and deletes references to memory that aren't used anymore.

// 2. Consider the code below:

var myNum = 1;

function foo() {
  var myStr = 'A string';
  // what is eligible for GC here? Nothing because this is the function definition
}

foo();

// what is eligible for GC here? 'A string' because foo() has already executed

// more code
// Are either of the values 1 or "A string" eligible for garbage collection on line 5? What about on line 10?

// 3. In the code below, is the value referenced by outerFoo eligible for garbage collection on line 10?

var outerFoo;

function bar() {
  var innerFoo = 0;
  outerFoo = innerFoo;
}

bar();

// can outerFoo's 0 be garbage collected here? No because it might be referred to in later code?

// more code

// 4. Consider the code below:

function makeEvenCounter() {
  var index = 0;
  return function() {
    return index += 2;
  };
}

var evenCounter = makeEvenCounter();

// is 0 eligible for GC here? No, because evenCounter has not been executed yet.

// more code
// Is 0 eligible for garbage collection on line 10?

// 5. Consider the script below:

var bash = "Some val";
// Will the value "Some val" ever be eligible for garbage collection?
// At the end of the program?
