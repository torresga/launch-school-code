// Lettercase Counter
// Write a function that takes a string and returns an object containing three properties: one representing the number of characters in the string that are lowercase letters, one representing the number of characters that are uppercase letters, and one representing the number of characters that are neither.

// Input: A string
// Output: An object with three properties representing the number of characters in the string that are lowercase, uppercase, or neither.

// Rules:
// - If char is lowercase 1 is added to the lowercase value
// - If char is uppercase 1 is added to the uppercase value
// - If char is neither then 1 is added to the neither value

//
// Data Structures
// object to hold lowercase, uppercase, and neither counts
//
// Algorithm
// 1. Create a regex to match lowercase chars
// 2. Create a regex to match uppercase chars
// 3. Create a regex to match neither uppercase or lowercase chars
// 4. If any of the counts are null, replace with 0
// 5. Return an object with counts for each

// Code
function letterCaseCount(string) {
  let lowercase = patternCount(/[a-z]/g, string);
  let uppercase = patternCount(/[A-Z]/g, string);
  let neither = patternCount(/[^a-zA-Z]/g, string);

  return {
    lowercase: lowercase,
    uppercase: uppercase,
    neither: neither,
  };
}

function patternCount(regex, string) {
  let matches = string.match(regex);

  return matches === null ? 0 : matches.length;
}
//
// Examples:

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }
