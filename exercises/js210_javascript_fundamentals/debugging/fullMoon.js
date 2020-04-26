// Full Moon
// Run the following code. Why is every warning displayed twice? Change the code so that each warning is displayed only once, as intended.

var species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
var isMidnight = true;
var isFullmoon = true;
var newSpecies;

function isTransformable(species) {
  return species[0] === 'w';
}

function transform(species) {
  return 'were' + species;
}

var i;
for (i = 0; i < species.length; i++) {
  var thisSpecies = species[i];
  newSpecies = ''; // this line gets hoisted further up. We should assign this to an empty string or something because newSpecies is only transformed down in the if statement so it's the same over multiple loops
  if (isMidnight && isFullmoon && isTransformable(thisSpecies)) {
      newSpecies = transform(thisSpecies);
  }

  if (newSpecies) {
    console.log('Beware of the ' + newSpecies + '!');
  }
}
