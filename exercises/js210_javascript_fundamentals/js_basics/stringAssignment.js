var name = 'Bob';
var saveName = name;
// This line returns a new value 'BOB'. It does not modify the string assigned to `name`. Also, strings are immutable.
name.toUpperCase();
console.log(name, saveName); // Bob Bob
