1.

Output:
8 - 'outer'
9. 'inner'
10. 'outer'

Line 8 - a is the global variable.

On line 4, 'var a' declares and assigns 'inner' to a new local variable 'a' inside of the new scope created by the function 'testScope'. that variable is only accessible inside of 'testScope'. This is an example of variable shadowing.

2.

Line 8 - 'outer'
Line 9 - 'inner'
Line 10 - 'inner'

On line 4, 'a' refers to the global variable defined on line 1. The value of 'a' is reassigned to 'inner'.

3.

'empty'
'play station'
'computer'

Line 8 displays first. It's value is 'empty'.

Then lines 19, 20, and 21 are called.

Line 19 calls `shop1()`. The function reassigns the global variable `basket` to 'tv'.
Line 20 calls `shop2()`. The function reassigns the global variable `basket` to 'computer'.
Line 21 calls `shop3()`. The function creates a new local variable `basket` and assigns to it 'play station'. This local variable `basket` is output to the console.

Then line 23 is called. It outputs the global variable `basket`.

4.
Line 6 outputs 'hello'. I think this is because line 2 creates a global variable `a`.

5.
I think Line 6 will output an error. (ReferenceError) This is because on line 2, we are defining a new local variable `a` to which we assign the string 'hello'.

6.
console.log(a); outputs undefined because of hoisting. JavaScript declares creates a new global variable `a`. `a` was never given a value, so the console.log(a) outputs 'undefined'. ASSIGNMENTS ARE NOT HOISTED.

7.
I think function declarations get hoisted up to the top first. If that's the case, then a = 1 declares a global variable `a` which has the value of 1.

Oh but we never call hello(). Therefore, `a` produces a ReferenceError because we don't declare it anywhere.
