// Equal
// Read through the following code. Currently, it does not log the expected result. Explain why this happens, then refactor the code so that it works as expected.

var person = { name: 'Victor' };

// we can assign otherPerson to the same object contained in person
var otherPerson = person;

console.log(person === otherPerson);    // false -- expected: true

// person === otherPerson logs false because person and otherPerson are two different objects.
