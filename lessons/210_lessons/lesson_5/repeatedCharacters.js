// Practice Problem: Repeated Characters
// Implement a function that takes a String as an argument and returns an object that contains a count of the repeated characters.

// repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
// repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
// repeatedCharacters('Pet');            // {}
// repeatedCharacters('Paper');          // { p: 2 }
// repeatedCharacters('Baseless');       // { s: 3, e: 2 }
// Note that repeatedCharacters does a bit more than simply count the frequency of each character: it determines the counts, but only returns counts for characters that have a count of 2 or more. It also ignores the case.

// Input: A string
// Output: An object that contains the count of repeated characters
// Looks like the counts are case insensitive

// Algorithm
// 1. Get the count of each character in an object
//   Create a new object
//   Downcase string
//   Loop through the string
//    if current letter is not a key in the object
//      Add key = 0
//    Add 1 to value
// 2. Create a new object, and put in it the key value pairs of letters with 2 or more instances
    // Create a new object
    // Loop through old object
    //   If value >= 2
    //     Add to new object
    // Return object

function repeatedCharacters(word) {
  var lowerCaseWord = word.toLowerCase();
  var allCounts = {};
  var repeatedCounts = {};
  var i;
  var count;

  for (i = 0; i < lowerCaseWord.length; i += 1) {
    if (Object.keys(allCounts).indexOf(lowerCaseWord[i]) === -1) {
      allCounts[lowerCaseWord[i]] = 0;
    }

    allCounts[lowerCaseWord[i]] += 1;
  }

  for (count in allCounts) {
    if (allCounts[count] > 1) {
      repeatedCounts[count] = allCounts[count];
    }
  }

  return repeatedCounts;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
