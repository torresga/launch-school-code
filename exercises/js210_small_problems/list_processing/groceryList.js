// Grocery List
// Write a function that takes a grocery list (a two-dimensional array) with each element containing a fruit and a quantity, and returns a one-dimensional array of fruits, in which each fruit appears a number of times equal to its quantity.

// Input: A nested array
// Output: A non-nested array

// What operation is this? (for the inner arrays). It's not transformation or selection.
//
// We can map the outer array, and then flatten it
//
// For the inner array, perhaps it's best to use a for loop? to loop innerArray[1] times
//
// Algorithm
// 1. Flat map outer array
// 2.   Create a new array
// 3.   Loop through inner array innerArray[1] times
// 4.    Add innerArray[0] to new array
// 5.   Return new array

function buyFruit(groceryList) {
  return groceryList.flatMap(function(fruitAndQuantity) {
    let fruit = [];

    for (let i = 0; i < fruitAndQuantity[1]; i += 1) {
      fruit.push(fruitAndQuantity[0]);
    }

    return fruit;
  });
}

//
// Example:

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
