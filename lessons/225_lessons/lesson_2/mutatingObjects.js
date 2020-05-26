// 1. What will the code below output to the console?
console.log('Exercise 1:');
var message = 'Hello from the global scope!';

function func(message) {
  message = 'Hello from the function scope!';
  console.log(message);
}

func(message); // 'hello from the function scope!'

// On line 6, 'message' refers to a variable local to the function 'func'.

console.log(message); // 'hello from the global scope!'

// 2. What will the code below log to the console? What does this output demonstrate in relation to the output of problem one?

console.log('Exercise 2');
var myObj = { message: 'Greetings from the global scope!' };

function func(obj) {
  obj.message = 'Greetings from the function scope!';
  console.log(obj.message);
}

func(myObj); // 'Greetings from the function scope!'

console.log(myObj.message); // 'Greetings from the function scope!'

// This output demonstrates that references to objects are passed in as arguments to functions. Wheras, strings (and other primitives) act as if they are passed by value.

// LS answer - The code demonstrates the mutability of objects. Changing a property in the object does not change the connection to any variables pointing to it.

// 3. What will the code below log to the console?
console.log('Exercise 3');
var message = 'Hello from the global scope!';

function func() {
  message = 'Hello from the function scope!';
  console.log(message);
}

func(); // 'Hello from the function scope!'
console.log(message); // 'Hello from the function scope!'
// This is because the `message` on line 39 refers to the `message` variable initialized on line 36. Since there are no arguments passed as local variables to the function `func`, JS looks for the first variable in an outer scope with the same name. That variable will be reassigned its' value.

// 4. What will the code below log to the console?

var a = 10;
var obj = {
  a: a,
}

var newObj = obj; // newObj and obj point to the same object
newObj.a += 10;
// newObj and obj:
// {
//   a: 20,
// }

console.log(obj.a === a); // false - refer to two different primitive values
console.log(newObj === obj); // true - refer to the same object

// 5. Consider the code below:

var animal = {
  name: 'Pumbaa',
  species: 'Phacochoerus africanus',
};

var menagerie = {
  warthog: animal,
};

animal = {
  name: 'Timom',
  species: 'Suricata suricatta',
};

menagerie.meerkat = animal;

console.log(menagerie.warthog === animal); // false
console.log(menagerie.meerkat === animal); // true
// If objects are mutable, why does the second to last line return false?
// On line 75, animal is reassigned to a different object that was assigned as the value to warthog in the menagerie object on line 72. Reassignment is not mutation.
