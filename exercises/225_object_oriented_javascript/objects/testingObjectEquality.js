// Testing Object Equality
// In JavaScript, comparing two objects either with == or === checks for object identity. In other words, the comparison evaluates to true if it's the same object on either side of == or ===. This is a limitation, in a sense, because sometimes we need to check if two objects have the same key/value pairs. JavaScript doesn't give us a way to do that.
//
// Write a function objectsEqual that accepts two object arguments and returns true or false depending on whether the objects have the same key/value pairs.

// Input: Two objects
// Output: Boolean representing whether the objects have the same key value pairs (whether their values are equal)
//
// Rules:
// - two objects are immediately unequal if the key-value pair lengths are unequal
// - Two primitive types that have the same values are always equal.
//
// Algorithm
// 1. Break objects up into arrays with keys and arrays with values.
// 2. Return false if both sets of keys have lengths that are not equal or both sets of values have lengths that are not equal
// 3. Loop through both sets of keys
// 4.  Return false if key from first object does not equal key from the second object
// 5. Loop through both sets of values
// 6.  Return false if value from first object does not equal value from the second object.
// 7. Return true

function objectsEqual(obj1, obj2) {
  let obj1Keys = Object.keys(obj1);
  let obj1Values = Object.values(obj1);
  let obj2Keys = Object.keys(obj2);
  let obj2Values = Object.values(obj2);

  if (obj1Keys.length !== obj2Keys.length || obj1Values.length !== obj2Values.length) {
    return false;
  }

  for (let i = 0; i < obj1Keys.length; i += 1) {
    if (obj1Keys[i] !== obj2Keys[i]) {
      return false;
    }
  }

  for (let i = 0; i < obj1Values.length; i += 1) {
    if (obj1Values[i] !== obj2Values[i]) {
      return false;
    }
  }

  return true;
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false
