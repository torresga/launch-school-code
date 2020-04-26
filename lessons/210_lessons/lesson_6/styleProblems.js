// Problems
//
// Identify the code that violates the Airbnb JavaScript style guide, and update the code to fix the issues you identify. There may be more than one issue in each code snippet.

// 1. var title = "The Three-Body Problem";
// Strings use double quotes instead of single quotes. Should be:
var title = 'The Three-Body Problem';

// 2. var title = 'The Three-Body Problem',
//     author = 'Cixin Liu',
//     page_count = 400;
// Use one var declaration per variable or assignment. page_count should be camelCase
var title = 'The Three-Body Problem';
var author = 'Cixin Liu';
var pageCount = 400;

// 3. var completed = lastPageRead == 400;
// Use === over ==.

var completed = lastPageRead === 400;

// 4. if (finishedBook())
//   console.log('You have finished reading this book');
// Use braces with multiline blocks.


if (finishedBook()) {
  console.log('You have finished reading this book');
}

// 5.
// function read(pages) {
//       console.log('You started reading.');
//       for (var i=0; i<pages; i++) {
//               var message = 'You read page '+i;
//               console.log(message);
//       }
// }
//
// read(400);

function read(pages) {
  console.log('You started reading.');
  for (var i=0; i<pages; i++) {
    var message = 'You read page '+i;
    console.log(message);
  }
}

read(400);

// 1. Spaces between variables and assignments
// 2. Don't use ++
// 3. Probably should turn i into a string and not rely on type coercion
// 4. Declare variables at the top of the function
// 5. Don't use function declarations
// 6. JS should have two spaces for indentation

var read = function read(pages) {
  var message;
  var i;

  console.log('You started reading.');
  for (i = 0; i < pages; i += 1) {
    message = 'You read page ' + String(i);
    console.log(message);
  }
}

read(400);
