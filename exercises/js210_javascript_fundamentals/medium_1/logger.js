// Logger
// Read through the following code. Why will it log 'debugging'?

function debugIt() {
  var status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

// It will log 'debugging' because the function logger has access to the variable status. A function has access to variables defined in an outer scope.
