// Matching Parentheses
// Write a function that takes a string as an argument and returns true if the string contains properly balanced parentheses, false otherwise. Parentheses are properly balanced only when '(' and ')' occur in matching pairs, with each pair starting with '('.

// Input: A string
// Output: A boolean representing whether all the parentheses are balanced.

// Rules:
// - A string is considered balanced if there are the same number of ( as )
// - ( has to come before ) in the string to be considered balanced

// So that we can loop over less characters, we can remove characters that are not ( or ) with regex.

// Data Structures
// Strings - we can loop over with for loop, and exit the loop

// Algorithm
// 1. Remove all characters that are not ( or ) from the string.
// 2. Keep a count of the brackets
// 3. Loop through the string
//     Add 1 to count if current character is (
//     Subtract 1 to count if current character is )
//     Return false if count falls less than 0
// 4. Return count === 0

// Code
function isBalanced(str) {
  let brackets = str.replace(/[^\(|\)]/g, '');
  let count = 0;

  for (let i = 0; i < brackets.length; i += 1) {
    if (brackets[i] === '(') {
      count += 1;
    } else if (brackets[i] === ')') {
      count -= 1;
    }

    if (count < 0) {
      break;
    }
  }

  return count === 0;
}

// Examples
console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false
