// 1.
// function makeCar(rate) {
//   return {
//     speed: 0,
//     rate: rate,
//     accelerate: function() {
//       this.speed += this.rate;
//     },
//   };
// }
//
// var sedan = makeCar(8);
// console.log(sedan);
// sedan.accelerate();
// console.log(sedan.speed); // 8
//
// var coupe = makeCar(12);
// console.log(coupe);
// coupe.accelerate();
// console.log(coupe.speed); // 12

// 2
// var hatchback = makeCar(9);
// console.log(hatchback);
// hatchback.accelerate();
// console.log(hatchback.speed);

// 3
function makeCar(rate, brakeRate) {
  return {
    speed: 0,
    rate: rate,
    brakeRate: brakeRate,
    accelerate: function() {
      this.speed += this.rate;
    },
    brake: function() {
      this.speed = (this.speed - this.brakeRate) < 0 ? 0 : this.speed - this.brakeRate;
    },
  };
}

var sedan = makeCar(8, 6);
sedan.accelerate();
console.log(sedan.speed); // 8
sedan.brake();
console.log(sedan.speed); // 2
sedan.brake();
console.log(sedan.speed); // 0
