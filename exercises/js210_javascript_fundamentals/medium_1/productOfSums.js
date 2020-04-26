// Product of Sums
// The productOfSums function shown below is expected to return the product of the sums of two arrays of numbers. Read through the following code. Will it produce the expected result? Why or why not?

function productOfSums(array1, array2) {
  var result;
  result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  var sum; // this needs to be assigned to a value because initially it is undefined
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    // so here sum is undefined + numbers[i]
    sum += numbers[i];
  }

  sum;
}

console.log(productOfSums([1, 2, 3], [1, 2, 3])); // expected result: 36

console.log(total([1, 2, 3])); // expected result: 6

// This code will not produce the expected result because total does not have a return value. You must return a value with the return statement for JavaScript to return a value other than undefined.
