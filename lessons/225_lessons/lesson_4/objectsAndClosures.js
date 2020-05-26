function makeList() {
  var items = [];
  // return function(newItem) {
  //   var index;
  //   if (newItem) {
  //     index = items.indexOf(newItem);
  //     if (index === -1) {
  //       items.push(newItem);
  //       console.log(newItem + ' added!');
  //     } else {
  //       items.splice(index, 1);
  //       console.log(newItem + ' removed!');
  //     }
  //   } else {
  //     if (items.length === 0) {
  //       console.log('The list is empty.');
  //     } else {
  //       items.forEach(function(item) {
  //         console.log(item);
  //       });
  //     }
  //   }
  // };

  return {
    add: function(newItem) {
      var index = items.indexOf(newItem);
      if (index === -1) {
        items.push(newItem);
        console.log(newItem + ' added!');
      }
    },
    list: function() {
      if (items.length === 0) {
        console.log('The list is empty.');
      } else {
        items.forEach(function(item) {
          console.log(item);
        });
      }
    },
    remove: function(newItem) {
      var index = items.indexOf(newItem);
      if (index !== -1) {
        items.splice(index, 1);
        console.log(newItem + ' removed!');
      }
    },
  }
}

var list = makeList();
list.add('peas');
// = peas added!
list.list();
// = peas
list.add('corn');
// // = corn added!
list.list();
// = peas
// = corn
list.remove('peas');
// = peas removed!
list.list();
// = corn

list.clear = function() {
  items = [];
  console.log('all items deleted!');
};
list.clear();
list.list();
