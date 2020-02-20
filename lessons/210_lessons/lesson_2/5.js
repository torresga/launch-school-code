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

var temperatures = [45, 50, 60, 54, 32];
console.log(average(temperatures));
