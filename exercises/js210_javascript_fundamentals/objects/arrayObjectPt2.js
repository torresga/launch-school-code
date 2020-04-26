// Array Object Part 2
// A user wrote a function that takes an array as an argument and returns its average. Given the code below, the user expects the average function to return 5. Is the user's expectation correct? Why or why not?

var myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

// myArray: [5, 5, '-1': 5, '-2': 5]

function average(array) {
  var sum = 0;
  var i;

  // array.length is 2 because myArray[-1] and myArray[-2] are key value pairs and are not counted in the length of the array.
  // so range of i is: -2 to 1

  // sum is 20
  for (i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  // when myArray is passed in, length is going to be 2 because myArray[-1] and myArray[-2] are not counted
  return sum / Object.keys(array).length;
}

console.log(average(myArray)); // returns 10

// The user is incorrect. Because arrays are objects, when we assign a value to a negative value index, we are actually assigning a new key-value pair to the array. These key value pairs are not counted in the array's length.
