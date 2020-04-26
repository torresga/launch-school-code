// Inventory Item Availability
// Building on the previous exercise, write a function that returns true or false based on whether or not an inventory item is available. As before, the function takes two arguments: an inventory item and a list of transactions. The function should return true only if the sum of the quantity values of the item's transactions is greater than zero. Notice that there is a movement property in each transaction object. A movement value of 'out' will decrease the item's quantity.
//
// You may (and should) use the transactionsFor function from the previous exercise.

// Input: An inventoryItem and a list of transactions
// Output: A boolean representing whether the item with the id of inventoryItem is available
//
// What is the shape of this problem?
// First, we want to create an array of arrays. Each inner array contains an object with the same id's. (group objects with same id into an array)
// Then we want to reduce the objects, we want to have a smaller number of objects with the quantity reduced
// Then we can filter through these objects

// Map transactions id
// remove duplicates
// Map array
//  Get transactions that match key

// [
//   [
//     { id: 101, movement: 'in',  quantity:  5 },
//     { id: 101, movement: 'in',  quantity: 12 },
//     { id: 101, movement: 'out', quantity: 18 }
//   ],
//   [
//     { id: 102, movement: 'out', quantity: 17 },
//     { id: 102, movement: 'out', quantity: 15 },
//     { id: 102, movement: 'in',  quantity: 22 }
//   ],
//   [
//     { id: 103, movement: 'out', quantity: 15 },
//     { id: 103, movement: 'out', quantity: 15 }
//   ],
//   [
//     { id: 105, movement: 'in',  quantity: 10 },
//     { id: 105, movement: 'in',  quantity: 25 }
//   ]
// ]

// Reduce the objects:
// Loop through the outer array
// Create a new object
// Add quantity and 0 to object
// Add id to object
// Loop through the inner array
//   Add quantity to object[quantity] if movement == 'in'
//   Subtract quantity from object[quantity] if movement == 'out'
// Return object
// Flatten array
//
// Examples:

var transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                     { id: 105, movement: 'in',  quantity: 10 },
                     { id: 102, movement: 'out', quantity: 17 },
                     { id: 101, movement: 'in',  quantity: 12 },
                     { id: 103, movement: 'out', quantity: 15 },
                     { id: 102, movement: 'out', quantity: 15 },
                     { id: 105, movement: 'in',  quantity: 25 },
                     { id: 101, movement: 'out', quantity: 18 },
                     { id: 102, movement: 'in',  quantity: 22 },
                     { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true

// Loop through the reduced records
// Return the transactions that match id
// return true if quantity > 0
// else return false

function isItemAvailable(id, transactions) {
  let transactionsForId = transactionsFor(id, reduceRecords(transactions));

  return transactionsForId[0]['quantity'] > 0;
}

// Reduce the objects:
// Loop through the outer array
// Create a new object
// Add quantity and 0 to object
// Add id to object
// Loop through the inner array
//   Add quantity to object[quantity] if movement == 'in'
//   Subtract quantity from object[quantity] if movement == 'out'
// Return object
// Flatten array

function reduceRecords(transactions) {
  let grouped = groupedById(transactions);
  return grouped.map(function(arr) {
    let obj = {};
    obj['id'] = arr[0]['id'];
    obj['quantity'] = 0;

    arr.forEach(function(elem) {
      if (elem['movement'] === 'in') {
        obj['quantity'] +=  elem['quantity'];
      }

      if (elem['movement'] === 'out') {
        obj['quantity'] -= elem['quantity'];
      }
    });

    return obj;
  });
}

// console.log(reduceRecords(transactions));

function groupedById(transactions) {
  let transactionIds = transactions.map(function(transaction) {
    return transaction['id'];
  });

  let uniqueIds = [];

  transactionIds.forEach(function(id) {
    if (uniqueIds.indexOf(id) === -1) {
      uniqueIds.push(id);
    }
  });

  return uniqueIds.map(function(id) {
    return transactionsFor(id, transactions);
  });
}

// console.log(groupedById(transactions));


function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(function(transaction) {
    return transaction.id === inventoryItem;
  });
}

// console.log(transactionsFor(101, transactions));
