// Anonymizer
// Using OLOO create an Account prototype object that anonymizes user objects on init. The created object should not have access to the function that anonymizes a user other than through the init and reanonymize methods. The function that anonymizes creates a 16 character sequence composed of letters and numbers. The following are the properties and methods on the Account object:
//
// init: The init method sets the email, password, firstName, lastName, and displayName of user. The displayName is a 16 character sequence generated for the user. It's used as the display name of a user.
// reanonymize: This method generates a new 16 character sequence and reassigns it to the displayName property if the password provided is valid. Returns true if successfully re-anonymized. Returns 'Invalid Password' if the password provided is not valid.
// resetPassword: This method asks the user for a new password and reassigns it to the password property. To reset the password, the user must provide the current password. Returns 'Invalid Password' if the password provided is not valid. Returns true if the password is successfully reset.
// firstName: This method returns the first name of the user if the password provided is valid. Returns 'Invalid Password' if the password provided is not valid.
// lastName: This method returns the last name of the user if the password provided is valid. Returns 'Invalid Password' if the password provided is not valid.
// email: This method returns the email name of the user if the password provided is valid. Returns 'Invalid Password' if the password provided is not valid.
// displayName: This property returns the displayName — the 16 character sequence.
// Other than the above properties, methods, and properties inherited from Object.prototype, no other method or property should exist on the object returned by the Account prototype object.
//

var Account = (function() {
  function generateSequence() {
    // generate a 16 character sequence of letters and numbers
    // Create an array of A to Z and numbers 0 to 9
    // Create a new string
    // Loop 16 times
    //  Add a random element of the array to the new string
    // Return string
    var charsAndNumbers = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').concat('0123456789'.split(''));
    var SEQUENCE_LENGTH = 16;
    var sequence = '';

    for (var i = 0; i < SEQUENCE_LENGTH; i += 1) {
      var randIndex = Math.floor(Math.random() * Math.floor(charsAndNumbers.length));
      sequence += charsAndNumbers[randIndex];
    }

    return sequence;
  }

  function createAccount() {
    return {
      email: '',
      password: '',
      firstName: '',
      lastName: '',
    };
  }

  return {
    init: function (email, password, first, last) {
      var account = createAccount();

      account.email = function() { return email; };
      account.password = function() { return password; };
      account.firstName = function() { return first; };
      account.lastName = function() { return last; };

      this.account = function() {
        return function() {
          return account;
        };
      };

      this.displayName = generateSequence();
      return this;
    },
    firstName: function(passwordToTry) {
      if (this.account()().password() === passwordToTry) {
        return this.account()().firstName();
      } else {
        return 'Invalid password';
      }
    },
    lastName: function(passwordToTry) {
      if (this.account()().password() === passwordToTry) {
        return this.account()().lastName();
      } else {
        return 'Invalid password';
      }
    },
    email: function(passwordToTry) {
      if (this.account()().password() === passwordToTry) {
        return this.account()().email();
      } else {
        return 'Invalid password';
      }
    },
    reanonymize: function(passwordToTry) {
      if (this.account()().password() === passwordToTry) {
        this.displayName = generateSequence();
        return true;
      } else {
        return 'Invalid password';
      }
    },
    resetPassword: function(currentPassword, newPassword) {
      if (this.account()().password() === currentPassword) {
        this.account()().password = function() { return newPassword; };
        return true;
      } else {
        return 'Invalid password';
      }
    },
    displayName: function() {},
  };
})();
// Here's a sample for your reference:

var fooBar = Object.create(Account).init('foo@bar.com', '123456', 'foo', 'bar');
console.log(fooBar);
console.log(fooBar.account());
console.log(fooBar.firstName);                     // returns the firstName function
console.log(fooBar.email);                         // returns the email function
console.log(fooBar.firstName('123456'));           // logs 'foo'
console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
console.log(fooBar.displayName);                   // logs 16 character sequence
console.log(fooBar.resetPassword('123', 'abc'))    // logs 'Invalid Password';
console.log(fooBar.resetPassword('123456', 'abc')) // logs true
//
var displayName = fooBar.displayName;
console.log(fooBar.reanonymize('abc'));                         // returns true
console.log(displayName === fooBar.displayName);   // logs false
//
var bazQux = Object.create(Account).init('baz@qux.com', '123456', 'baz', 'qux');
console.log(bazQux.firstName('123456'));
console.log(fooBar.displayName);
console.log(bazQux.displayName);
console.log(fooBar.firstName('abc'));              // logs 'baz' but should log foo.
console.log(fooBar.email('abc'));                  // 'baz@qux.com' but should 'foo@bar.com'

console.log(bazQux.firstName('123456'));              // logs 'baz' but should log foo.
console.log(bazQux.email('123456'));                  // 'baz@qux.com' but should 'foo@bar.com'
