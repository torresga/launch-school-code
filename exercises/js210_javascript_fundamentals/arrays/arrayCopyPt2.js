// Array Copy Part 2
// In the previous exercise, the value of the reference gets copied. For this exercise, only the values of the array should be copied, but not the reference. Implement two alternative ways of doing this.
//
// Here is the code from the previous exercise:

// Alternative 1
var myArray = [1, 2, 3, 4];
var myOtherArray = myArray.slice();

myArray.pop(); // [1, 2, 3]
console.log(myArray);
console.log(myOtherArray); // [1, 2, 3, 4]


// Alternative 2
var myArray = [1, 2, 3, 4];
var myOtherArray = [];
for (var i = 0; i < myArray.length; i++) {
  myOtherArray.push(myArray[i]);
}

myArray.pop(); // [1, 2, 3]
console.log(myArray);
console.log(myOtherArray); // [1, 2, 3, 4]
