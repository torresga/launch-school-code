// 1. Write a function that returns the object on a given object's prototype chain where a property is defined. See the example code below:

function getDefiningObject(object, propKey) {
  // Loop
  // If object hasOwnProperty that equals propKey, return object
  // reassign object to its' prototype
  // return null

  while (object) {
    if (object.hasOwnProperty(propKey)) break;

    object = Object.getPrototypeOf(object);
  }

  return object;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // => true
console.log(getDefiningObject(qux, 'e'));             // => null

// 2. Write a function to provide a shallow copy of an object. The object that you copy should share the same prototype chain as the original object, and it should have the same own properties that return the same values or objects when accessed. Use the code below to verify your implementation:

function shallowCopy(object) {
  // create a new object from the current object's prototype
  // Loop through the object
    // If the object has the current property
    //  Add it to the new object
  // return new object
  var newObject = Object.create(Object.getPrototypeOf(object));

  for (prop in object) {
    if (Object.prototype.hasOwnProperty.call(object, prop)) {
      newObject[prop] = object[prop];
    }
  }

  return newObject;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

var baz = shallowCopy(bar);
console.log(baz.a);       // => 1
baz.say();                // => c is 3
console.log(baz.hasOwnProperty('a'));  // false
console.log(baz.hasOwnProperty('b'));  // false

var a = {
  hasOwnProperty: 1,
};

shallowCopy(a);

// 3. Write a function that extends an object (destination object) with contents from multiple objects (source objects).

function extend(destination) {
  // Have to get arguments that are not destination into an array
  // Loop through array
  //   Assign to destination the current source
  // return destination

  [].slice.call(arguments).slice(1).forEach(function(currentObj) {
    Object.assign(destination, currentObj);
  });

  return destination;
}

var foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

var joe = {
  name: 'Joe'
};

var funcs = {
  sayHello: function() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye: function() {
    console.log('Goodbye, ' + this.name);
  },
};

var object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // => 1
object.sayHello();                // => Hello, Joe
