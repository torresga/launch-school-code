// 1. Create a makeCounterLogger function that takes a number as an argument and returns a function. When we invoke the returned function with a second number, it should count up or down from the first number to the second number, logging each number to the console:

function makeCounterLogger(startNumber) {
  return function (endingNumber) {
    // create an increment value
    // assign to increment value
    //  if startNumber < endingNumber, increment is 1
    //  else increment is -1
    // loop from start to end, increment by increment
    //  log current number

    var increment = startNumber < endingNumber ? 1 : -1;
    for (var i = startNumber; i != endingNumber; i += increment) {
      console.log(i);
    }
    console.log(endingNumber);
  };
}

var countlog = makeCounterLogger(5);
countlog(8);
// 5
// 6
// 7
// 8
countlog(2);
// 5
// 4
// 3
// 2

// 2. We'll build a simple todo list program using the techniques we've seen in this assignment. Write a makeList function that returns a new function that implements a todo list. The returned function should have the following behavior:

// * When called with an argument that is not already on the list, it adds that argument to the list.
// * When called with an argument that is already on the list, it removes the element from the list.
// * When called without arguments, it logs all items on the list. If the list is empty, it logs an appropriate message.

function makeList() {
  var list = [];

  return function(todo) {
    // if todo is undefined, log all items on the list
    if (todo === undefined) {
      if (list.length === 0) {
        console.log('The list is empty.');
        return;
      }

      list.forEach(function(todo) {
        console.log(todo);
      });

      return;
    }

    // When called with an argument that is already on the list, it removes the element from the list.
    if (list.includes(todo)) {
      // get index of todo
      // splice list at index, and 1
      list.splice(list.indexOf(todo), 1);
      console.log(todo + ' removed!');
      return;
    }

    list.push(todo);
    console.log(todo + ' added!');
    return;
  };
}

var list = makeList();
list();
// The list is empty.
list('make breakfast');
// make breakfast added!
list('read book');
// read book added!
list();
// make breakfast
// read book
list('make breakfast');
// make breakfast removed!
list();
// read book
