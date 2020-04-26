// Dynamic
// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

var prop2 = '456';
myObject['prop2'] = '456'; //reassigns 'prop2' to '456'
myObject[prop2] = '678'; // assigns '456' to '678', so myObject looks like this:

// {
//   prop1: '123',
//   prop2: '456',
//   'prop 3': '345',
//   '456': '678'
// }

console.log(myObject[prop2]); // 678
console.log(myObject.prop2); // 456
console.log(myObject);

// Further Exploration
// Here is another example. What do you think will be logged to the console this time, and why?

var myObj = {};
myObj[myFunc()] = 'hello, ';

// obj: {
//   myFunc() : 'hello, ',
// }

function myFunc() {
  return 'funcProp';
}

// the above is a different myFunc() than the one inside myObj

console.log(myObj);

// obj: {
//   myFunc() : 'hello, ',
// }

myObj[myFunc()] = 'world!';

// the above reassigns myFunc() to 'world!'
console.log(myObj);

// obj: {
//   myFunc() : 'world!',
// }
