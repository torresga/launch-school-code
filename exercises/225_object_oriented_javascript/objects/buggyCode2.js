// Buggy Code 2
// A grocery store uses a JavaScript function to calculate discounts on various items. They are testing out various percentage discounts but are getting unexpected results. Go over the code, and identify the reason why they aren't getting the expected discounted prices from the function. Then, modify the code so that it produces the correct results.

var item = {
  name: 'Foo',
  description: 'Fusce consequat dui est, semper.',
  price: 50,
  quantity: 100,
  discount: function(percent) {
    var discount = (this.price * percent) / 100;
    // We weren't getting the correct discount because we were modifying this.price during each method call of `discount` - we don't want this method to modify the original price.
    // this.price -= discount;

    return this.price - discount;
  },
};

console.log(item.discount(20));   // should return 40
// = 40
console.log(item.discount(50));   // should return 25
// = 20
console.log(item.discount(25));   // should return 37.5
// = 15
