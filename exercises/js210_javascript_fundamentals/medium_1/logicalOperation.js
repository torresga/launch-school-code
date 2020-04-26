// Logical Operation
// What will each line of the following code return? Don't run the code until after you have tried to answer.

// What is considered falsy?
// false
// undefined
// null
// ''
// 0
// NaN

console.log((false && undefined)); // false because they are both falsy
console.log((false || undefined)); // false
console.log(((false && undefined) || (false || undefined))); // false || false which is false
console.log(((false || undefined) || (false && undefined))); // false || false which is false
console.log(((false && undefined) && (false || undefined))); // false && false which is false
console.log(((false || undefined) && (false && undefined))); // false && false which is false
console.log(('a' || (false && undefined) || '')); // true || false || false which is true?
console.log(((false && undefined) || 'a' || '')); // false || true || false which is true
console.log(('a' && (false || undefined) && '')); //true && false && false which is false
console.log(((false || undefined) && 'a' && ''));  //false && true && false which is false

&& and || 
