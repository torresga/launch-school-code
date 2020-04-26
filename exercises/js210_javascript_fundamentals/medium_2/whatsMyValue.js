// What's My Value?
// What will the following program log to the console? Can you explain why?

var array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';

// ['Apples', 'Peaches', 'Grapes', '3.4': 'Oranges']

console.log(array.length); // 3

console.log(Object.keys(array).length); // 4

array[-2] = 'Watermelon';

// ['Apples', 'Peaches', 'Grapes', '3.4': 'Oranges', '-2': 'Watermelon']

console.log(array.length); // 3

console.log(Object.keys(array).length); // 5

// array.length does not count key-value pairs. array.length only counts integer indexes. Whereas Object.keys counts all keys
