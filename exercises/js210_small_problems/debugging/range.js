// Range
// We are assigned the task to implement a range function that returns an array of integers beginning and ending with specified start and end numbers. When only a single argument is provided, that argument should be used as the ending number and the starting number should be 0.
//
// Check our code below. Why do the the example invocations fail with an error saying Maximum call stack size exceeded? Can you fix the code, so it runs without error and satisfies the requirements?

// there are two functions named range. The bottom one overwrites the top one. It also refers to the top one, which is overwritten inside the method.

function range(start, end) {
  console.log(start);
  console.log(end);

  if (end === undefined) {
    end = start;
    start = 0;
  }

  var range = [];
  var element;
  for (element = start; element <= end; element++) {
    console.log(element);
    range.push(element);
  }

  return range;
}



// Examples

console.log(range(10, 20));
console.log(range(5));
console.log(range(4, 0));

// Further exploration
// There are two reasons why the following is not a working solution. Can you spot them?
function range(start, end) {
  console.log(`start: ${start}, end: ${end}`);
  console.log(!end);

  if (!end) {
    // start and end are both assigned to 0
    start = 0;
    end = start;
  }

  var range = [];
  var element;
  for (element = start; element <= end; element++) {
    console.log(element);
    range.push(element);
  }

  return range;
}
