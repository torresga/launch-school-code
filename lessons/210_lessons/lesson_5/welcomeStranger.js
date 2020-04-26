// Practice Problem: Welcome Stranger
// Write a function that takes two arguments, an array and an object. The array will contain two or more elements that, when combined with spaces, produce a person's full name. The object will contain two keys, title and occupation, and suitable values for both items. Your function should log a greeting to the console that uses the person's full name, and mentions the person's title and occupation.
// Input: An array and an object
// Output: A string

// Algorithm
// Join array into a string
// Create a new string for occupation
// Add values to occupation
// Return string: 'Hello, ' + name + '! Nice to have a ' + occupation + ' around.'

function greetings(name, titleAndOccupation) {
  var fullName = name.join(' ');
  var job = titleAndOccupation.title + ' ' + titleAndOccupation.occupation;

  console.log('Hello, ' + fullName + '! Nice to have a ' + job + ' around.');
}

// Example:

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.
