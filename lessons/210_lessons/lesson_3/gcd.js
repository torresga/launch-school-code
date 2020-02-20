// Greatest Common Divisor
// Create a function that computes the Greatest Common Divisor of two positive integers.
//
// Example
// gcd(12, 4);   // 4
// gcd(15, 10);  // 5
// gcd(9, 2);    // 1

// Input: Two positive integers
// Output: The greatest common divisor between those two numbers

// How do we find the divisors in one number?

// Input: Two positive integers
// Output: A positive integer// GCD algorithm// 1. Take two numbers, a and b
// 2. If a is zero
//       return b
//    else if b is zero
//       return a
// 3.  Else
// 4.   Get remainder of a / b
// 5.   assign a to b
// 6.   assign remainder to b
// 5.   gcd(a, b)

function gcd(a, b) {
  if (a === 0) {
    return b;
  } else if (b === 0) {
    return a;
  } else {
    remainder = a % b;
    a = b;
    b = remainder;
    return gcd(a, b);
  }
}

console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1
