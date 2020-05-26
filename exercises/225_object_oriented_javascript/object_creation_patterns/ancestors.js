// Ancestors
// Implement an ancestors method that returns the prototype chain (ancestors) of a calling object as an array of object names. Here's an example output:

// name property added to make objects easier to identify
var foo = {name: 'foo'};
var bar = Object.create(foo);
bar.name = 'bar';
var baz = Object.create(bar);
baz.name = 'baz';
var qux = Object.create(baz);
qux.name = 'qux';

Object.prototype.ancestors = function() {
  // Create an array to hold the prototypes
  // Loop until this is Object.prototype
  //  Add this.name to new array
  //  Reset this to current object's prototype
  // Add Object.prototype to array
  // Return array

  var ancestors = [];
  var that = Object.getPrototypeOf(this);

  // while (that != Object.prototype) {
  while (that.hasOwnProperty('name')) {
    ancestors.push(that.name);
    that = Object.getPrototypeOf(that);
  }

  ancestors.push('Object.prototype');
  return ancestors;
};

console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
console.log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
console.log(bar.ancestors());  // returns ['foo', 'Object.prototype']
console.log(foo.ancestors());  // returns ['Object.prototype']
