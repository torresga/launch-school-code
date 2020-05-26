// Buggy Code 1
// The code below is expected to output the following when run:
//
// > var helloVictor = createGreeter('Victor');
// > helloVictor.greet('morning');
// = Good Morning Victor

function createGreeter(name) {
  return {
    name: name,
    morning: 'Good Morning',
    afternoon: 'Good Afternoon',
    evening: 'Good Evening',
    greet: function(timeOfDay) {
      var msg = '';
      switch (timeOfDay) {
        case 'morning':
        // name works instead of this.name because name is referenceing the local variable `name` passed in as an argument to the createGreeter function. Demonstrates closures - a function is a closure, and its' outside environment is part of the closure's binding.
          msg += this.morning + ' ' + name;
          break;
        case 'afternoon':
          msg += this.afternoon + ' ' + name;
          break;
        case 'evening':
          msg += this.evening + ' ' + name;
          break;
      }

      console.log(msg);
    },
  };
}
// However, it instead results in an error. What is the problem with the code? Why isn't it producing the expected results?

var helloVictor = createGreeter('Victor');
helloVictor.greet('morning');
// = Good Morning Victor

helloVictor.greet('afternoon');
// = Good Afternoon Victor

helloVictor.greet('evening');
// = Good Evening Victor

// Line 18 causes the ReferenceError. 'morning' is not defined. The problem is that `morning` is treated as a local variable, and is not accessing the property `morning`. We can use 'this' to access the property.
