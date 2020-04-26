// Practice Problem: Formatting Bands
// We have the following Array of information for some popular bands:
//
// let bands = [
//   { name: 'sunset rubdown', country: 'UK', active: false },
//   { name: 'women', country: 'Germany', active: false },
//   { name: 'a silver mt. zion', country: 'Spain', active: true },
// ];
// There are problems with this data, though, so we first have to clean it up before we can use it:
//
// The band countries are wrong: all the bands should have 'Canada' as the country.
// The band name should have all words capitalized.
// Remove all dots from the band names.
// Write a function that can process the input band Array and return an Array that contains the fixed information.

// Input: An array
// Output: A new array

// Capitalize name:
//  Split name into an array of words
//  Loop through the words
//    Map words: first char uppercase + last of word
//  Join words
//
// Algorithm
// 1. Map the array
      // Create a new object
      // Add name: the value of obj[name] without periods
//    Assign obj[country] to 'Canada'
//    Assign active to obj[active]
//    Return new object

let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function capitalizeName(name) {
  return name.split(' ').map(function(section) {
    return section[0].toUpperCase() + section.slice(1);
  }).join(' ');
}

function removeDotsInName(name) {
  return name.replace('.', '');
}

function processBands(data) {
  return data.map(function(band) {
    let correctedBand = {};
    correctedBand.name = removeDotsInName(capitalizeName(band.name));
    correctedBand.country = 'Canada';
    correctedBand.active = band.active;
    return correctedBand;
  });
}

console.log(processBands(bands));
console.log(bands);

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]
