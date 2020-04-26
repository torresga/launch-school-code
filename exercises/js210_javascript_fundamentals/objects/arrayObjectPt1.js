// Array Object Part 1
// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var myArray = ['a', 'b', 'c'];

console.log(myArray[0]); // 'a'
console.log(myArray[-1]); // undefined

myArray[-1] = 'd';
myArray['e'] = 5;
myArray[3] = 'f';

console.log(myArray[-1]); // 'd'
console.log(myArray['e']); // 5
console.log(myArray); // ['a', 'b', 'c', -1: 'd', 'e': 5, 'f']

// The above should be:
// ['a', 'b', 'c', 'f', '-1': 'd', e: 5]
// All that have a numerical index come first
// Keys are strings, so -1 is turned into '-1'
