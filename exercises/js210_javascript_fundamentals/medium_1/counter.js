// Counter
// What will the following code snippets log?
//
// Code Snippet 1
// var counter = 5;
// var rate = 3;
// console.log('The total value is ' + String(counter * rate));
//
// function counter(count) {
//   // ...
// }
// The function is hoisted, so counter first contains the function, and then counter is reassigned to 5. So the output is: 'The total value is 15'

// Code Snippet 2
// function counter(count) {
//   // ...
// }
//
// console.log('The total value is ' + String(counter * rate));
//
// var counter = 5;
// var rate = 3;

// counter and rate are hoisted. variable assignments are done after function declarations. so counter is still 5 but rate is undefined. So output: 'The total value is NaN' (5 * undefined) is NaN
//
// Code Snippet 3
// var counter = 5;
// var rate = 3;
//
// function counter(count) {
//   // ...
// }
//
// console.log('The total value is ' + String(counter * rate));
// Output is still: 'The total value is 15' because of the function declaration being hoisted above the variable declaration.
