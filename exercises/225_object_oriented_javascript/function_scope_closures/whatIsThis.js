// What is This
// Read the following code carefully. What do you think is logged on line 7. Try to answer the question before you run the code.

var person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
};

console.log(person.fullName); // this logs out NaN because this.firstName and this.lastName are undefined.

// Is this not available to properties of an object??
// I guess `this` has to do with function calls. Since no functions are called, `this`'s context is the global object. Since the global object does not have neither a firstName nor a lastName property, both properties have the value undefined. undefined + undefined = NaN
