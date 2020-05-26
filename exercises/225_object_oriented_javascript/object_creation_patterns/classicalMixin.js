// Classical Object Creation with Mixin
// In this exercise, you'll make an extend function and use it to add a mixin to the previous exercise. The mixin adds an invoice and payTax methods.

function Person(firstName, lastName, age, gender) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
  this.gender = gender;
}

Person.prototype.fullName = function() { return this.firstName + ' ' + this.lastName };
Person.prototype.communicate = function() { console.log('Communicating'); };
Person.prototype.eat = function() { console.log('Eating'); };
Person.prototype.sleep = function() { console.log('Sleeping'); };

function Doctor(firstName, lastName, age, gender, specialization) {
  Person.call(this, firstName, lastName, age, gender);
  this.specialization = specialization;
}

Doctor.prototype = Object.create(Person.prototype);
Doctor.prototype.constructor = Doctor;
Doctor.prototype.diagnose = function() { console.log('Diagnosing'); };

function Professor(firstName, lastName, age, gender, subject) {
  Person.call(this, firstName, lastName, age, gender);
  this.subject = subject;
}

Professor.prototype = Object.create(Person.prototype);
Professor.prototype.constructor = Professor;
Professor.prototype.teach = function() { console.log('Teaching'); };

function Student(firstName, lastName, age, gender, degree) {
  Person.call(this, firstName, lastName, age, gender);
  this.degree = degree;
}

Student.prototype = Object.create(Person.prototype);
Student.prototype.constructor = Student;
Student.prototype.study = function() { console.log('Studying'); };

function GraduateStudent(firstName, lastName, age, gender, degree, graduateDegree) {
  Student.call(this, firstName, lastName, age, gender, degree);
  this.graduateDegree = graduateDegree;
}

GraduateStudent.prototype = Object.create(Student.prototype);
GraduateStudent.prototype.constructor = GraduateStudent;
GraduateStudent.prototype.research = function () { console.log('Researching'); };

// extend is a function that takes two objects, a new object of the types we already declared above, and professional
// extend looks as if it adds the properties of professional to the new object
function extend(objToExtend, objExtendingFrom) {
  // Loop through objectExtendingFrom's own properties
  //   Add those properties to the objToExtend
  // return objToExtend
  Object.getOwnPropertyNames(objExtendingFrom).forEach(function(property) {
    objToExtend[property] = function() {
      return objExtendingFrom[property].call(objToExtend)
    };
  });

  return objToExtend;
}

// professional looks to be an object with the properties invoice and payTax
var professional = {
  invoice: function() { console.log(this.fullName() + ' is Billing customer'); },
  payTax: function() { console.log(this.fullName() + ' Paying taxes'); },
}

// Check out the example run and note how the professional mixin is applied to the Doctor and Professor constructors via extend:

var doctor = extend(new Doctor('foo', 'bar', 21, 'gender', 'Pediatrics'), professional);
console.log(doctor instanceof Person);     // logs true
console.log(doctor instanceof Doctor);     // logs true
doctor.eat();                              // logs 'Eating'
doctor.communicate();                      // logs 'Communicating'
doctor.sleep();                            // logs 'Sleeping'
console.log(doctor.fullName());            // logs 'foo bar'S
doctor.diagnose();                         // logs 'Diagnosing'

var professor = extend(new Professor('foo', 'bar', 21, 'gender', 'Systems Engineering'), professional);
console.log(professor instanceof Person);     // logs true
console.log(professor instanceof Professor);  // logs true
professor.eat();                              // logs 'Eating'
professor.communicate();                      // logs 'Communicating'
professor.sleep();                            // logs 'Sleeping'
console.log(professor.fullName());            // logs 'foo bar'
professor.teach();                            // logs 'Teaching'

console.log(doctor);
doctor.invoice();                          // logs 'foo bar is Billing customer'
doctor.payTax();                           // logs 'foo bar Paying taxes'

professional.invoice = function() {
  console.log(this.fullName() + ' is Asking customer to pay');
};

doctor.invoice();                          // logs 'foo bar is Asking customer to pay'
professor.invoice();                       // logs 'foo bar is Asking customer to pay'
professor.payTax();                        // logs 'foo bar Paying taxes'
