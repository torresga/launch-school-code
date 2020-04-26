// Hello Friends!
// You have written basic functions to display a random greeting to any number of friends upon each invocation of greet. Upon invoking the greet function, however, the output is not as expected. Figure out why not and fix the code.

function randomGreeting() {
  var words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
               'Greetings', 'Salutations', 'Good to see you'];

  var idx = Math.floor(Math.random() * words.length);

  // this is missing a return statement, this function returns undefined
  return words[idx];
}

function greet() {
  // this converts the arguments object to a real array
  var names = Array.prototype.slice.call(arguments);
  var i;

  // i++ is a style issue
  for (i = 0; i < names.length; i += 1) {
    var name = names[i];

    // This is not calling the randomGreeting function
    var greeting = randomGreeting();

    console.log(greeting + ', ' + name + '!');
  }
}

greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');
// called as is, greet outputs the code inside of randomGreeting for each element greet is called with.
