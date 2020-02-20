// Ddaaiillyy ddoouubbllee
// Write a function that takes a string argument, and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

// Input: A string argument
// Output: A new string
//
// Removes all the consecutive duplicate characters.
// Doesn't mean that all characters in the new string are unique. It just means that consecutive characters are unique.

// Algorithm
// Create a new string
// Loop over the old string
//    if the last character of the new string equals the current character of the old string
//     continue looping
//    Else
//      Add current character to the new string
// return the new string

function crunch(string) {
  var noDups = '';
  var i;

  for (i = 0; i < string.length; i += 1) {
    if (noDups.slice(-1) === string[i]) {
      continue;
    } else {
      noDups += string[i];
    }
  }

  return noDups;
}

// Examples:

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""

//
// Further Exploration
// You may have noticed that the solution continues iterating until index points past the end of the string. As a result, on the last iteration, text[index] is the last character in text, while text[index + 1] is undefined. Why does it do this? What happens if it stops iterating when index is equal to text.length - 1?

// If the loop stops iterating when index is equal to text.length - 1, the crunchText string will be missing an 'e'. That's because it's checking whether the element is equal to the next element.

function crunch(text) {
  var index = 0;
  var crunchText = '';

  while (index < text.length - 1) {
    if (text[index] !== text[index + 1]) {
      crunchText += text[index];
    }
    index += 1;
  }

  return crunchText;
}
