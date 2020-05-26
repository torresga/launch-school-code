// 1. What does this point to in the code below, and what does the method return?

var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

myObject.myChildObject.myMethod(); // returns undefined, `this` refers to the object inside the value of the property myChildObject.

// 2. In the previous problem, how would you change the context, or the value of this, to be the parent myObject?

var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

myObject.myChildObject.myMethod.call(myObject);

// 3. What does the following code log to the console?

var person = {
  firstName: 'Peter',
  lastName: 'Parker',
  fullName: function() {
    console.log(this.firstName + ' ' + this.lastName +
                ' is the Amazing Spiderman!');
  },
};

var whoIsSpiderman = person.fullName.bind(person);
whoIsSpiderman(); // 'Peter Parker is the Amazing Spiderman!'

// 4. What does the following code log to the console?

var a = 1;
var obj = {
  a: 2,
  func: function() {
    console.log(this.a);
  },
};

obj.func(); // 2 - context is the calling object
obj.func.call(); // 1 because the default this passed into call is the global object
obj.func.call(this); // 1 because context is the global object (this refers to the global object)
obj.func(obj); // 2 - context is still the calling object, argument is ignored

var obj2 = { a: 3 };
obj.func.call(obj2); // 3 because context is now obj2

// 5. What does the following code log to the console?

var computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    var tax = 3000;
    function specialDiscount() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }
    // should be: return this.price + this.shipping + tax - specialDiscount.call(this);
    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total()); // 35000, because inside specialDiscount, `this` refers to the global object (Window). this.price is undefined, therefore 0 is returned.

// If you want this program to log 34000, how would you fix it?
// To fix it, I would call specialDiscount with this passed in as the object.
