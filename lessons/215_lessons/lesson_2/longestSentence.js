// Code Review: Longest Sentence
// Write a program that determines the sentence with the most words in some text. Sentences may end with periods (.), exclamation points (!), or question marks (?). Sentences always begin with a word character. You should treat any sequence of characters that are not spaces or sentence-ending characters, as a word. Log the longest sentence and its word count to the console. Pay attention to the expected output. Note that this problem is about manipulating and processing strings. As such, every detail about the string matters (e.g., case, punctuation, tabs, spaces, etc.).
//

// Input: A string
// Output: A string representing the sentence with the most words.
//
// Rules:
// - Sentences may end with periods (.), exclamation points (!) and question marks ?
// - Sequences of characters that are not spaces or sentence ending characters are words.
//
// - In each sentence, do we count characters like '--' as words? Yes.
// - Output contains the ending punctuation for each sentence. So while sentences may end with periods, exclamation points, and question marks, we have to keep those things in the sentence (which split doesn't do.)

// - Looking at the input, there is a space after each sentence ender (or a space beginning each sentence. Can we split on that? instead)

// Regex: split on space following .!?

// Mental model: Split string into sentences on the spaces following .!? Count words in each sentence. Return the sentence that has the most words.

// Data structurfe

// Algorithm
// 1. Split string into an array on .!?.
// 2. Sort sentences based on sentence length.
// 3. Return the sentence with the most words.
//
// To find sentence with the most words:
// 1. Split sentence into an array on spaces
// 2. Get length of array
//
// To sort sentences based on sentence length:
// 1. Pass in an anonymous function that returns a number (a - b) to get a number

// Example
let longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';

function longestSentence(text) {
  let sentences = text.split(/(?<=[.?!])\s/);
  let longest;

  sentences.sort(sortByLength);
  longest = sentences[0];
  
  console.log(longest);
  console.log('');
  console.log(`The longest sentence has ${getLength(longest)} words.`);
  console.log('');
}

function sortByLength(sentence1, sentence2) {
  return getLength(sentence2) - getLength(sentence1);
}

function getLength(sentence) {
  return sentence.split(/\s/).length;
}

longestSentence(longText);

longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced.'

  longestSentence(longText);

// console output
// It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.
//
// The longest sentence has 86 words.


// Assuming the last sentence is removed:

// longestSentence(longText);

// console output
// Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.
//
// The longest sentence has 30 words.
