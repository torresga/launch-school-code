// Literal
// Identify the bug in the following code. Don't run the code until after you've tried to answer.

var myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

console.log(myObject[1]);
console.log(myObject[a]); // This returns undefined, the a property is a string so for bracket notation you have to enclose the property with quotes because it's a string.
console.log(myObject.a);
