var myBoolean = true;
var myString = 'hello';
var myArray = [];
var myOtherString = '';

if (myBoolean) {
  // This should output 'Hello'
  console.log('Hello');
}

if (!myString) {
  // This is not output because this is evaluated as false ('hello' is truthy, ! turns the string into boolean false)
  console.log('World');
}

if (!!myArray) {
  // This is output because [] is considered truthy, and !! turns it into boolean true
  console.log('World');
}

if (myOtherString || myArray) {
  // '' is falsy but [] is truthy
  console.log('!');
}
