// Practice Problems: Working with Object Properties
//1.  Write a function named objectHasProperty that takes two arguments: an Object and a String. The function should return true if the Object contains a property with the name given by the String, false otherwise.

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

// Input: an object and a string
// Output: true if the object contains a property with the name given by the string, or false

function objectHasProperty(obj, property) {
  // Loop through the object
  // Return true if object's property equals property
  // Return false
  var elem;
  for (elem in obj) {
    if (elem === property) {
      return true;
    }
  }

  return false;
}

console.log(objectHasProperty(pets, 'dog'));       // true
console.log(objectHasProperty(pets, 'lizard'));    // false
console.log(objectHasProperty(pets, 'mice'));      // true

// 2. Write a function named incrementProperty that takes two arguments: an Object and a String. If the Object contains a property with the specified name, the function should increment the value of that property. If the property does not exist, the function should add a new property with a value of 1. The function should return the new value of the property.

// Input: An object and a string
// Output: a number
// If the object contains a property that is the same as the string,
//   Increment the value of that property
// else
//   Add a new property with the value of 1
//
// Return the new value of the property

function incrementProperty(obj, property) {
  if (Object.keys(obj).indexOf(property) !== -1) {
    obj[property] += 1;
  } else {
    obj[property] = 1;
  }

  return obj[property];
}

var wins = {
  steve: 3,
  susie: 4,
};

console.log(incrementProperty(wins, 'susie'));   // 5
console.log(wins);                               // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy'));    // 1
console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }

// 3. Write a function named copyProperties that takes two Objects as arguments. The function should copy all properties from the first object to the second. The function should return the number of properties copied.

// Input: Two objects
// Output: the number of properties copied
//
// Create variable to hold properties
// Loop through first object
//   Add property and value to second object
//   Add 1 to properties variable

function copyProperties(first, second) {
  var numberOfProperties = 0;

  var prop;
  for (prop in first) {
    second[prop] = first[prop];
    numberOfProperties += 1;
  }

  return numberOfProperties;
}

var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);                       // { model: 9000, enabled: true }

// 4. Write a function named wordCount that takes a single String as an argument. The function should return an Object that contains the counts of each word that appears in the provided String. In the returned Object, you should use the words as keys, and the counts as values.

// Input: Single string
// Output: an object that contains the count of each word that appears in the provided string

// Algorithm
// Create a new object
// Split string into an array
// Loop through the array
//   If current word is a property in the object
//     Add 1 to the property's value
//   Else
//     Add object[property] = 1
//
// Return object

function wordCount(str) {
  var counts = {};
  var words = str.split(' ');
  var i;
  var word;

  for (i = 0; i < words.length; i += 1) {
    word = words[i];
    if (counts[word]) {
      counts[word] += 1;
    } else {
      counts[word] = 1;
    }
  }

  return counts;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }
