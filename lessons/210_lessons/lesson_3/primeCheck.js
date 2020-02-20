// Prime Check
// Write a function that takes a number argument, and returns true if the number is prime, or false if it is not.
//
// You may assume that the input is always a non-negative integer.
//
// Example
// isPrime(1);   // false
// isPrime(2);   // true
// isPrime(3);   // true
// isPrime(43);  // true
// isPrime(55);  // false
// isPrime(0);   // false


// Input: non-negative integer
// Output: boolean

// Boolean represents whether the input is prime or not
// How do we find a prime number? What is a prime number?

// A prime number is a number that is only divisible by 1 and itself.
// 0 and 1 are not prime, and 2 is. 2 is the only even prime
// Have some clauses? Return false if number is 0, 1, or divisible by 2 and not 2

// Algorithm
// Return false if input number is 0, 1, or divisible by 2 and not 2.
//
// Else
//   Loop through 1 to number
//     If number is divisible by current number
//       Break
//       Return false
//   Return true

function isPrime(number) {
  if ((number === 0) || (number === 1) || ((number % 2 === 0) && number != 2)) {
    return false;
  } else {
    for (var i = 3; i < number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }
}

console.log(isPrime(1));   // false
console.log(isPrime(2));   // true
console.log(isPrime(3));   // true
console.log(isPrime(43));  // true
console.log(isPrime(55));  // false
console.log(isPrime(0));   // false
