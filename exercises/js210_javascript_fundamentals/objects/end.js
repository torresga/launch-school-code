// The End is Near But Not Here
// The penultimate function takes a string as an argument and returns the next-to-last word in the string. The function assumes that "words" are any sequence of non-whitespace characters. The function also assumes that the input string will always contain at least two words. The penultimate function in the example below does not return the expected result. Run the code below, check the current result, identify the problem, explain what the problem is, and provide a working solution.

// Examples:

function penultimate(string) {
  // The problem with this code is that there is no value at key -2. We cannot access array elements using negative indexes. We can assign negative numbers as KEYS of an object.
  // return string.split(' ')[-2];
  var words = string.split(' ');
  return words[words.length - 2];
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"
