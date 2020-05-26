// Garbage Collection
// Read the following code carefully. Will the JavaScript garbage collection mechanism garbage collect the variable count after the function counter is run on line 10?

function makeCounter() {
  var count = 1;

  return function() {
    console.log(count++)
  };
}

var counter = makeCounter();
counter();

// No, JS cannot garbage collect the variable count because is used inside of the function that is returned from makeCounter()
