// 1. Our desired output for the code below is: Christopher Turk is a Surgeon. What will the code output, and what explains the difference, if any, between the actual and desired outputs?

var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }
};

function logReturnVal(func) {
  var returnVal = func();
  console.log(returnVal);
}

logReturnVal(turk.getDescription);

// This code will ouput: 'undefined undefined is a undefined'.
// On line 17, a method definition is passed into logReturnVal. Inside, turk.getDescription is called and its' return value is passed into returnVal. Since a method's context depends on where it was called, implicitly `this` refers to the global object. Since the global object does not contain the properties 'firstName', 'lastName', or 'occupation', each of those are considered 'undefined'.

// 2. Alter logReturnVal such that it takes an additional context argument, and use one of the methods we've learned in this lesson to invoke func inside of logReturnVal with context as its function execution context. Alter the invocation of logReturnVal and supply turk as the context argument.

function logReturnVal(func, context) {
  var returnVal = func.call(context);
  console.log(returnVal);
}

logReturnVal(turk.getDescription, turk);

// 3. Suppose that we want to extract getDescription from turk, but always have it execute with turk as context. Use one of the methods we've learned in the last lesson to assign such a permanently bound function to a new variable, getTurkDescription.

var getTurkDescription = turk.getDescription.bind(turk);
console.log(getTurkDescription());

// 4. Consider the code below, and our desired output:

var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();

// Desired output:
//
// The Elder Scrolls Arena
// The Elder Scrolls Daggerfall
// The Elder Scrolls Morrowind
// The Elder Scrolls Oblivion
// The Elder Scrolls Skyrim
// Will this code log our desired output? Why or why not?

// This code will log:
// undefined Arena
// undefined Daggerfall
// undefined Morrowind
// undefined Oblivion
// undefined Skyrim
// because an anonymous function's implicit execution context is not the object it's called inside, its' context is the global object. Since the global object does not have a property called seriesTitle, that value is considered undefined.

// Use the var self = this fix to alter TESgames.listGames such that it logs our desired output to the console.

var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    var self = this;

    this.titles.forEach(function(title) {
      console.log(self.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();

// 6. If we don't want to rely on var self = this, forEach provides us with an alternative means of supplying execution context to the inner function. Use this means to achieve our desired output.
var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    }, this);
  }
};

TESgames.listGames();

// 7. Consider the code below:

var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;
    }

    increment();
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();
console.log(foo.a);
// What will the value of foo.a be after this code has executed?
// 0, because `this` does not have the object as its' context inside of incrementA. Functions nested inside of methods lose the context of its' object- instead its' context is the global object.

// 8. Use one of the methods we learned in this lesson to invoke increment with explicit context such that foo.a is incremented with each invocation of incrementA.
var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;
    }

    increment.call(this);
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();
console.log(foo.a);

// 9. We decide that we want each invocation of foo.incrementA to increment foo.a by 3, rather than 1, and alter our code accordingly:

var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;
    }
    // or also:
    // var increment = function() {
      // this.a += 1;
    // }.bind(this);

    var incrementWithContext = increment.bind(this);
    incrementWithContext();
    incrementWithContext();
    incrementWithContext();
  }
};
foo.incrementA();
console.log(foo.a);

// Calling apply three times seems repetitive, though. Use bind to permanently set foo as increment's execution context.
