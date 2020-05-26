// Mini Inventory Management System:
// - item creator
//   - makes sure all necessary information is present and valid
// - items manager
//   - creating items, updating information about items, deleting items, and querying information about the items
// - reports manager
//   - generates reports for a specific item or all items

var ItemCreator = (function() {
  // Create a function to create sku code
   // It consists of the first 3 letters of the item and the first 2 letters of the category. If the item name consists of two words and the first word consists of two letters only, the next letter is taken from the next word.
  function skuCode(itemName, category) {
     // Remove spaces in itemName
     // Return first three letters of itemName + firstTwo letters in category
     itemNameNoSpaces = itemName.replace(/\s*/g, '');
     return (itemNameNoSpaces.slice(0, 3) + category.slice(0, 2)).toUpperCase();
  }

  // Create a function to validate itemName
  // itemName must have a min length of 5 characters, without spaces
  function isValidName(itemName) {
    return itemName.replace(/\s*/g, '').length >= 5;
  }

  // Create a function to validate quantity
  // Must not be undefined
  function validateQuantity(quantity) {
    return quantity !== undefined;
  }

  // Create a function to validate category
  // must contain a minimum of 5 characters and is only one word (does not contain spaces)
  function validateCategory(category) {
    return category.length >= 5 && !/\s/.test(category);
  }

  function informationValid(itemName, category, quantity) {
    return isValidName(itemName) && validateQuantity(quantity) && validateCategory(category);
  }

  return {
    init: function(itemName, category, quantity) {
      if (informationValid(itemName, category, quantity)) {
        this.skuCode = skuCode(itemName, category);
        this.itemName = itemName;
        this.category = category;
        this.quantity = quantity;
      } else {
        this.notValid = true;
      }

      return this;
    },
  };
})();

var ItemManager = {
  findItem: function(skuCode) {
    return this.items.filter(function(item) {
      return item.skuCode === skuCode;
    })[0];
  },
  create: function(itemName, category, quantity) {
  // creates a new item and adds it items. returns false if creation is not successful
    var newItem = Object.create(ItemCreator).init(itemName, category, quantity);

    if (newItem.notValid) {
      return false;
    }

    this.items.push(newItem);
  },
    update: function(skuCode, informationToUpdate) {
      // This method accepts an SKU Code and an object as an argument and updates any of the information on an item. You may assume valid values will be provided.

      var item = this.findItem(skuCode);

      // LOOK through the list and find the object that has that code
      // Loop through the informationToUpdate
      //  If object has that property
      //    Update object's value with informationToUpdate's value
      Object.getOwnPropertyNames(informationToUpdate).forEach(function(property) {
        if (item.hasOwnProperty(property)) {
          item[property] = informationToUpdate[property];
        }
      });

    },
    delete: function(skuCode) {
      // This method accepts an SKU Code and deletes the item from the list. You may assume a valid SKU code is provided.
      // Find the index of the object that has a skuCode that matches the skuCode
      // Splice allItems - start at index, delete 1

      var itemIndex = this.items.findIndex(function(item){
        return item.skuCode === skuCode;
      });

      this.items.splice(itemIndex, 1);
    },
    items: [],
    inStock: function() {
      // list all the items that have a quantity greater than 0
      return this.items.filter(function(item) {
        return item.quantity > 0;
      });
    },
    itemsInCategory: function(category) {
      // list all the items for a given category
      return this.items.filter(function(item) {
        return item.category === category;
      });
    },
};

var ReportManager = (function() {
  return {
    init: function(manager) {
      this.items = manager;
      return this;
    },
    reportInStock: function() {
      var itemNames = this.items.inStock().map(function(item) {
        return item.itemName;
      });

      console.log(itemNames.join(','));
    },
    createReporter: function(skuCode) {
      // the returned object has one method, itemInfo. It logs to the console all the properties of an object as "key:value" pairs (one pair per line). There are no other properties or methods on the returned object (except for properties/methods inherited from Object.prototype).

      var item = this.items.findItem(skuCode);
      return {
        itemInfo: function() {
          // look in this.items for the object matching the sku code

          Object.keys(item).forEach(function(property) {
            console.log(property + ': ' + item[property]);
          });
        },
      };
    },
  };
})();

ItemManager.create('basket ball', 'sports', 0);           // valid item
ItemManager.create('asd', 'sports', 0);                   // not valid since the item name is not 5 chars
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports');                 // not valid since quantity is blank
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking items', 0);    // not valid since category must be only one word
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

console.log(ItemManager.items);
// returns list with the 4 valid items

console.log('report manager:');
ReportManager.init(ItemManager);
ReportManager.reportInStock();
// // logs soccer ball,football,kitchen pot
//
ItemManager.update('SOCSP', { quantity: 0 });
console.log(ItemManager.inStock());
// // returns list with the item objects for football and kitchen pot
//
ReportManager.reportInStock();
// // // logs football,kitchen pot
console.log(ItemManager.itemsInCategory('sports'));
// // returns list with the item objects for basket ball, soccer ball, and football
//
ItemManager.delete('SOCSP');
console.log('Remaining 3 items');
console.log(ItemManager.items);
// // returns list with the remaining 3 valid items (soccer ball is removed from the list)
//
var kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// // logs
// // skuCode: KITCO
// // itemName: kitchen pot
// // category: cooking
// // quantity: 3
//
ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10
