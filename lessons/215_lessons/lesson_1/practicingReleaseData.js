// Write a Function named processReleaseData that processes the following movie release data:

let newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 0,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];

// The Function should generate an Array of Objects that contain only the id and title key/value pairs. You may assume that id, when existing, is an integer greater than 0. Here are the rules:

// Keep only releases that have both id and title data present.
// Keep only the id and title data for each release.

// Input: an array of hashes
// Output: An array of hashes

// Rules:
// - does this output a new array of new hashes? (I guess we will say yes)
// - keep the hashes that have both id and title data
// - create a hash that has id and title data

// Algorithm
// 1. Filter array of objects to get only objects that have id and title.
// 2. Map array of objects:
//   For each object, create a new object that has title and id
// 3. Return mapped array

function processReleaseData(data) {
  // let filtered = data.filter(obj => obj.id && obj.title);
  let filtered = data.filter(obj => obj.hasOwnProperty('id') && obj.hasOwnProperty('title'));
  let mapped = filtered.map(function(obj) {
    let newObj = {};
    for (key in obj) {
      if (key == 'id' || key == 'title') {
        newObj[key] = obj[key];
      }
    }

    return newObj;
  })

  return mapped;
}

console.log(processReleaseData(newReleases));

// should return:
// [{ id: 70111470, title: 'Die Hard'}, { id: 675465, title: 'Fracture' }];

// The current solution assumes that the value of id will be an integer value greater than 0. If it was possible to have a value of 0 for id, what would the implications be to the current solution? What changes, if any, would need to be made in order to handle the 0 value?
// If any of the ids are currently 0, they would not be included in the output because obj.id && obj.title would return false, so the object with the id of 0 would not be filtered. We would have to adapt that line so it would be: object has an id and object has a title
