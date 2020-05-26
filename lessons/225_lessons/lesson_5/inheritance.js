// 1. What will the code below log to the console?

var foo = {};
var bar = Object.create(foo);

foo.a = 1;

console.log(bar.a); // it will log 1 because bar 'inherits' properties from foo?

// 2. What will the code below log to the console?

var foo = {};
var bar = Object.create(foo);

foo.a = 1;
bar.a = 2;
console.log(bar.a); // 2 because you can override properties from inherited objects

// 3. Given the code below, do we know for certain that on the last line we are ultimately referencing a property owned by boo? How can we test that far is not delegating to boo?

var boo = {};
boo.myProp = 1;

var far = Object.create(boo);

// lots of code

far.myProp;       // 1
// No we do not know for certain. There could be code later that overrides the property `myProp` inherited from boo. We can test that far is not delegating to boo by calling 'hasOwnProperty' on far.

console.log(far.hasOwnProperty('myProp'));
