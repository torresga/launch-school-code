// Amount Payable
// What does the following code log? Why is this so?

var startingBalance = 1;
var chicken = 5;
var chickenQuantity = 7;

var totalPayable = function (item, quantity) {
  return startingBalance + (item * quantity);
};

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity)); // 5 + (5 * 7) which is 40

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity)); // I think this is 45 because 10 + (5 * 7)

// the function inside of totalPayable creates a closure over startingBalance and keeps track of what that value contains.
