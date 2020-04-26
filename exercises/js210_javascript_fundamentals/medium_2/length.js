// Length
// Read through the code below. What values will be logged to the console? Can you explain these results?

var languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages); // ['JavaScript', 'Ruby', 'Python']
console.log(languages.length); // 3

languages.length = 4;
console.log(languages); // ['Javascript', 'Ruby', 'Python', undefined]
console.log(languages.length); // 4

languages.length = 1;
console.log(languages); // ['JavaScript']
console.log(languages.length); // 1

languages.length = 3;
console.log(languages); // ['JavaScript', undefined, undefined]
console.log(languages.length); // 3

languages.length = 1;
languages[2] = 'Python';
console.log(languages); // ['JavaScript', undefined, 'Python']
console.log(languages[1]); // undefined
console.log(languages.length); // 3
