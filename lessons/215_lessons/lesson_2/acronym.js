// Acronym
// Write a function that generates and returns an acronym from a string of words. For example, the function should return "PNG" for the string "Portable Network Graphics". Count compound words (words connected with a dash) as separate words.

// Input: A string
// Output: A new string composing of the capital letters of the input string

// Rules:
// - Count words connected with a dash as separate words
// - That means not every word in the acronym are capitalized in the input array
// - For camelCase words, we only count the first character
//
// - have to remove hyphens
// - take out first character of the word

// Data Structures
// Let's split string into an array, map the array and turn into a string
//
// Algorithm
// 1. Replace hyphens with a single space in the string
// 2. Split string into an array, using whitespace as a delimiter
// 3. Map the array
//     Get first character of the word uppercase
// 4. Return the mapped array joined as a string

// Examples
function acronym(string) {
  let noHyphens = string.replace(/-/g, ' ');

  return noHyphens.split(' ').map(function(word) {
    return word[0].toUpperCase();
  }).join('');
}

console.log(acronym('Portable Network Graphics'));                  // "PNG"
console.log(acronym('First In, First Out'));                        // "FIFO"
console.log(acronym('PHP: HyperText Preprocessor'));                // "PHP"
console.log(acronym('Complementary metal-oxide semiconductor'));    // "CMOS"
console.log(acronym('Hyper-text Markup Language'));                 // "HTML"
