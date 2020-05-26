// 1. In the following code, when can JavaScript garbage collect the values represented by the variables a, b, and c?

var a = 34;

function add(b) {
  a += b;
} // the variable b can be garbage collected after add is executed

function run() {
  var c = add(4);
} // c can be garbage collected after this function returns

run();
// a can be garbage collected after run is executed

// 2. In the following code, when can JavaScript garbage collect the value "Steve"?

function makeHello(name) {
  return function() {
    console.log("Hello, " + name + "!");
  };
}

var helloSteve = makeHello("Steve");
// after the inner function inside of makeHello returns? 
