function average(arr) {
  return sum(arr) / arr.length;
}

function sum(arr) {
  var total = 0;

  for (var i = 0; i < arr.length; i++) {
    total += arr[i];
  }

  return total;
}

console.log(average([3, 3, 8, 3, 3]));
