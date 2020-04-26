// Halvsies
// Write a function that takes an array as an argument, and returns an array that contains two elements, each of which is an array. Put the first half of the original array elements in the first element of the return value, and put the second half in the second element. If the original array contains an odd number of elements, place the middle element in the first half array.

// Input: An array
// Output: A nested array
//
// Rules:
// - Put half of original array in first element of nested array
// - Put second half in the second element
// - if original array contains odd number of elements, place middle in the first half of the array
//
// Data Structure
// arrays
//
// Algorithm

// Examples:

halvsies([1, 2, 3, 4]);       // [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]);    // [[1, 5, 2], [4, 3]]
halvsies([5]);                // [[5], []]
halvsies([]);                 // [[], []]
