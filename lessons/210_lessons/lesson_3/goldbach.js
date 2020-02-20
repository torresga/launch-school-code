// Goldbach Numbers
// Write a function named checkGoldbach that uses Goldbach's Conjecture to log every pair of primes that sum to the number supplied as an argument. The conjecture states that "you can express every even integer greater than 2 as the sum of two primes". The function takes as its only parameter, an integer n, and logs all combinations of two prime numbers whose sum is n. Log the prime pairs with the smaller number first. If n is odd or less than 4, your function should log null.
//
// Your checkGoldbach function may call the isPrime function you wrote for a previous practice problem.
//
// Example
// checkGoldbach(3);
// // logs: null
//
// checkGoldbach(4);
// // logs: 2 2
//
// checkGoldbach(12);
// // logs: 5 7
//
// checkGoldbach(100);
// // logs:
// // 3 97
// // 11 89
// // 17 83
// // 29 71
// // 41 59
// // 47 53

// Input: An integer
// Output: All the combinations of two prime numbers whose sum is n

// Edge cases:
// if n is odd or less than 4, return null

// How do I get the number pairs?
// Each number pair needs to be odd and prime


// Algorithm
// Get an array of prime numbers from 3 up to but not including input
// 1.  Create a new array
// 2.  Loop from 3 up to but not including input
//       Add number to array if number is prime
// 3. Return array
//
// Return null if number is odd or less than 4
// Return '2 2' if number is 4
// Get array of Primes
// Loop through primes
//  Loop through primes again
//    If primes[i] + primes[j] == number and if first prime is less than second one (to remove duplicates)
//      Output number

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

function getPrimeArray(endNumber) {
  var array = [];

  for (var i = 3; i < endNumber; i++) {
    if (isPrime(i)) {
      array.push(i);
    }
  }

  return array;
}

function checkGoldbach(number) {
  if ((number < 4) || number % 2 == 1) {
    console.log(null);
  }

  if (number === 4) {
    console.log('2 2');
  }

  var primes = getPrimeArray(number);

  for (var i = 0; i < primes.length; i++) {
    for (var j = 0; j < primes.length; j++) {
      if (primes[i] + primes[j] === number && primes[i] < primes[j]) {
        console.log(String(primes[i]) + ' ' + String(primes[j]));
      }
    }
  }
}

checkGoldbach(3);
// // logs: null
//
checkGoldbach(4);
// // logs: 2 2
//
checkGoldbach(12);
// // logs: 5 7
//
checkGoldbach(100);
// // logs:
// // 3 97
// // 11 89
// // 17 83
// // 29 71
// // 41 59
// // 47 53
