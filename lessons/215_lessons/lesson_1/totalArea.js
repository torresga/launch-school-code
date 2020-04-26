// Write a Function named totalArea that takes an Array of rectangles as an argument. The Function should return the total area covered by all the rectangles.

// Input: A nested array of arrays
// Output: A number

// Rules:
// - Each inner array represents height and width of a rectangle

// Algorithm
// 1. Loop through the array using map (because we want to transform the array)
// 2.  Reduce the inner arrays - multiply product times current element
// 3. Reduce the mapped array - get the sum of all elements

function addInnerArrays(product, elem) {
  return product * elem;
}

function totalArea(rectangles) {
  let areas;

  areas = rectangles.map(function(arr) {
    return arr.reduce(addInnerArrays);
  });

  return areas.reduce(function(sum, current) {
    return sum += current;
  });
}

// let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

// console.log(totalArea(rectangles));    // 141

// Now, write a second Function named totalSquareArea. This Function should calculate the total area of a set of rectangles, just like totalArea. However, it should only include squares in its calculations: it should ignore rectangles that aren't square.

// Input: An array of arrays
// Output: a Single number

// Rules:
// - only calculate the numbers that are squares

// Algorithm
// 1. Filter the rectangles for squares (first element of inner array === second element)
// 2. Use total area to calculate square area

function totalSquareArea(rectangles) {
  let squares = rectangles.filter(rectangle => rectangle[0] === rectangle[1]);

  return totalArea(squares);
}


let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

totalSquareArea(rectangles);    // 121
