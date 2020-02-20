1.

<s>This all depends on whether a condition creates a new scope in JS. I am going to say that it does create a new scope, so the console.log will return a ReferenceError, as it is not declared outside of the condition.</s>Scoping in JavaScript is function level, not block level.

Ok, so it actually outputs:
undefined
undefined

But I don't know why.

Is it because of JS hoisting rules, that the var a is hoisted up at the beginning of the function declaration. So instead JS treats it as:

function say() {
  var a;

  if (false) {
    a = 'hello from inside a block';
  }

  console.log(a);
}

say();

Since the condition is never false, a is not assigned to any value. Since it is not assigned to any value anywhere else in the function, a is undefined.

2.
'hello'
ReferenceError: 'a' is not defined

Functions create a new scope. Therefore, a = 'hello' is the same as:
var a;
a = 'hello'; JS does not do the hoisting to declare the variable outside of the function.

3. a will output 4 because for loops do not create a new scope. Therefore, we are reassigning the global variable a to the current value of i. When the loop ends, i is equal to 4, and a is assigned the value of 4.

4.
4
3

This is because foo() reassigns the value of the global variable a to 2. Then it returns bar(), which assigns the global variable of a to 3 and returns 4.

5.

Line 18 returns 'superNested'
Line 19 returns 'global'

This is because lines 4 and 6 create new local variables. On line 8, a is reassigned. This a refers to the local variable created on line 6.

6.
'outer'
'outer'
'outer'
'inner'

a is not reassigned because 'function arguments become local variables in the function' inside setScope, b refers to the global variable b. that global variable gets reassigned.

7.
50
60
15

Inside of incrementBy, total refers to the global variable 'total'. the local variable 'increment' refers to the parameter 'increment'.

total is changed inside of incrementBy so it is changed outside as well. On line 11, increment refers to the global variable assigned on line 2.

8.
'outer'
Some kind of error

Because hosting function expressions works differently. Only the declaration is hoisted. Same as:

var a;
var setScope;

a = 'outer';

console.log(a);
setScope(); // gives an error - because this isnt a function
console.log(a);
setScope = function () {
  a = 'inner';
}
