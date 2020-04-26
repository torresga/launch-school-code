// An Example Problem: Comparing Version Numbers
// To look at the steps of this problem solving approach in depth, we will work through a problem and see how to apply each step in the process. The problem we will look at compares software version numbers.

// While version numbers often appear to be decimal numbers, they are, in fact, a convenient notation for a more complicated number system. The following are all legal version numbers:

// 1
// 1.0
// 1.2
// 3.2.3
// 3.0.0
// 4.2.3.0
// Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

// If version1 > version2, we should return 1.
// If version1 < version2, we should return -1.
// If version1 === version2, we should return 0.
// If either version number contains characters other than digits and the . character, we should return null.
// Here is an example of version number ordering:

// 0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

// Process the Problem

// Input: Two numbers representing version numbers
// - Are these numbers input as numbers? Numbers can be input as strings
// - Version numbers can only contain digits and the . character

// Output: 1, -1, or 0, representing whether both version numbers are 1, -1, or 0. (or null)

// Implicit and explicit requirements:
// - Version numbers look like decimals, but are not.
// - Version numbers act like decimals in some cases
//   - If we have two numbers that both contain one decimal point, and both numbers are less than 10, then both numbers act like decimal numbers
//   - If either number is greater than 10, then they do not act like decimal numbers
//   - A number that has more 'parts' than another number is larger when all the other parts up to the 'extra' part are the same.

// Rules:
// - If version1 and version2 do not have the same number of 'parts', we should add a 0 for any mising parts.
// - Return null if either version number contains any character other than digits or .
// - Return 1 if version1 > version2
// - Return -1 if version1 < version2
// - Return 0 if version1 === version2

// Mental model: Split each version number string into an array on '.'. If length of one version number is less than the other, add enough 0's so that the lengths are equal. Compare each element at the same index to each other. Return 1, -1, or 0 based on result.

// Examples:
// 0.1 < 1.0 because 0.1 is less than 1 (like decimal number)
// 1 is equal to 1.0  (like decimal number)
// 1.0 < 1.1 (like a decimal number)
// 1.1 < 1.2 (like a decimal number)
// 1.2 is equal to 1.2.0.0 (like a decimal number)
// 1.2.0.0 < 1.18.2 (10 and beyond are not considered like decimal numbers)
// 1.18.2 < 13.37 (whether a version number is bigger than another one does not depend on how many 'parts' the version number has)

// 1.18.2 and 1.18 - 1.18.2 is larger because both versions start with 1.18
// 1.18.2 < 13.37 because 13 > 1

// Data Structures
// - input: string
// - array
//   - map each part into a Number
//   - compare each part of respective version number together (compare each array's element of the same index)

//   1.2.0.0 < 1.18.2.0

//   Comparing 1 and 1
//   1 and 1 are equal
//   Compare 2 and 18
//   18 > 2 so we can stop and return -1

// - Return null if either version number contains any character other than digits or .
// - Return 1 if version1 > version2
// - Return -1 if version1 < version2
// - Return 0 if version1 === version2

// Algorithm
// 1.2.0.0 < 1.18.2.0 = -1
// [1, 2, 0, 0]  [1, 18, 2, 0]
// 1 and 1
// 2 and 18
// 2 and 0

// 1.18.2 13.37
// [1, 18, 2] [13, 37, 0]
// 1 and 13
// -1

// 1.2 1.1 = 1
// [1, 2] [1, 1]
// 1 and 1
// 2 and 1

// 0. Return null if version1 or version2 contains any character other than digits or . (or null if number starts or ends with a period)
// 1. Get max length of strings
// 2. Make string lengths match (pass in max length)
// 3. Return 0 if version1 === version2
// 4. Split both version numbers on periods into arrays
// 5. Map each string in version numbers into a Number
// 6. Loop through each of the arrays at the same index
// 7.  if current number in version1 >= version2
//       continue to the next number
//     If current number in version1 < version2
//       break out of the loop and return -1
// 8. Return 1

// Make string lengths match:
// Input: String, maxLength
// If string equals the max length
//   return string
// Else while string less than max length
//   add '.0'
// return new string

// Test algorithm with test cases

// Code with Intent

function compareVersions(version1, version2) {
  let regex = /[^0-9\.]|(^\.)|(\.$)|(\.{2,})/g;

  if (regex.test(version1) || regex.test(version2)) {
    return null;
  }

  let longest = Math.max(version1.length, version2.length);
  let version1Str = makeLengthsMatch(version1, longest);
  let version2Str = makeLengthsMatch(version2, longest);

  if (version1Str === version2Str) {
    return 0;
  }

  let version1Numbers = version1Str.split('.').map((number) => Number(number));
  let version2Numbers = version2Str.split('.').map((number) => Number(number));

  for (let i = 0; i < version1Numbers.length; i += 1) {
    if (version1Numbers[i] >= version2Numbers[i]) {
      continue;
    } else if (version1Numbers[i] < version2Numbers[i]) {
      return -1;
    }
  }

  return 1;
}


function makeLengthsMatch(str, length) {
  if (str.length === length) {
    return str;
  }

  let longerStr = str;
  while (longerStr.length < length) {
    longerStr += '.0';
  }

  return longerStr;
}

console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1
