// Search Word Part 1
// Write a function that takes a word and a string of text as arguments, and returns an integer representing the number of times the word appears in the text.
//
// You may assume that the word and text inputs will always be provided.

// Input: A word and a string of text
// Output: An integer representing the number of times the word appears in the text

// Rules:
// - Assume that word and text will always be provided
//
// lets use regex and match
//
// Data structure
// strings - match returns an array
//
// Algorithm
// 1. Turn input word into a regex using RegExp (account for global matches and case insensitivity)
// 2. Match the text using match
// 3. Return the length of the resulting array
//

function searchWord(word, text) {
  let searchRegex = RegExp('\\b' + word + '\\b', 'ig');

  return text.match(searchRegex) === null? 0 : text.match(searchRegex).length;
}
// Example:

var text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

console.log(searchWord('sed', text));      // 3

console.log(searchWord('hello', text)); // 0

console.log(searchWord('qui', text));      // should return 4, NOT 13)
// Further Exploration
// The current solution matches the word even when it is just a part of a bigger word, instead of a whole word by itself. For example, when searching for 'qui' in the text, this solution would also return 'quia' as a match:
//
// searchWord('qui', text);      // should return 4, NOT 13
// Can you refactor the current solution so that it only matches whole words? In addition to this, can you also include input validation to handle cases in which one or both arguments are missing?
//
// Hint: If you cannot figure out how to match whole words only, check out this section of our Introduction to Regular Expressions book.
