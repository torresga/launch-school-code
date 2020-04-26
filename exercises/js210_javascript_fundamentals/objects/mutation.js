// Mutation
// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
var array2 = [];
var i;

for (i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
} // pushes all elements of array1 to array2 so array1 and array2 reference the same values

for (i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  } // changes Curly, Chemp, and Chico to CURLY, CHEMP, and CHICO. array1[i] is assigned a new string primitive
}

console.log(array2); // This logs ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'] because the changes in array1 do not affect array2. The second for loop reassigns array1[i] if the element starts with 'C' so array2 and array1 now reference different string primitives

// Further Exploration
// What would happen if an object literal was part of the array1 elements pushed to array2? Would changes made to the object literal in array1 be reflected in array2? I think so, because objects are mutable.

var array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo', {firstName: 'Johnny', lastName: 'Quest'}];
var array2 = [];
var i;

for (i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
}

console.log(array1);

array1[8]['lastName'] = 'Bravo';

console.log('array2:');
console.log(array2);


// How would you change the code so that any changes made to array1 in the second for loop get reflected to array2?

// assign array1 and array2 to the same array object:

var array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
var array2 = array1;
var i;

for (i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  } // this changes both array1 and array2 because both variables refer to the same array object
}

console.log(array1);
console.log(array2);
