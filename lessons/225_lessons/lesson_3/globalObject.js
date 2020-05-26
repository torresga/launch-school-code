// 1. In a browser environment, what object serves as the implicit execution context?
// window

// 2. In a browser environment, what does the code below log?
//
// a = 10;
//
// console.log(window.a === a);

// true because a is a global variable, which is a property of the global object.

// 3. What does the code below log?
//
// function func() {
//   var b = 1;
// }
//
// func();
//
// console.log(b);

// Uncaught ReferenceError because b is not defined outside of func().

// 4. What does the code below log?
//
// function func() {
//   b = 1;
// }
//
// func();
//
// console.log(b);

// This logs 1 because inside of the function `func` a global variable 'b' is created.

// 5. Of the variables a, b, and c below, can any be successfully deleted?
//
// var a = 1;
// b = 'Hi there';
// var c = '-50';
//
// delete a; // ?
// delete b; // ?
// delete c; // ?

// b can be deleted because it is an undeclared global property

// 6. In the code below, will we be able to delete func?
//
// function func() {
//   console.log("I'm a function!");
// }
//
// delete func; // ?
// No because func is considered declared.

// 7. Of the variables a, b, and c below, can any be deleted?
//
// window.a = 1;
// b = 2;
// var c = b;
//
// delete window.a; // ?
// delete window.b; // ?
// delete window.c; // ?

// b because it is an undeclared global variable. a can be deleted as well because it is a global variable added explicitly to the global object as a property
