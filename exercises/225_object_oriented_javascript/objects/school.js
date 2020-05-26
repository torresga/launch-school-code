// School
// Create a school object. The school object uses the student object from the previous exercise. It has methods that use and update information about the student. Be sure to check out the previous exercise for the other arguments that might be needed by the school object. Implement the following methods for the school object:
//
// addStudent: Adds a student by creating a new student and adding the student to a collection of students. The method adds a constraint that the year can only be any of the following values: '1st', '2nd', '3rd', '4th', or '5th'. Returns a student object if year is valid otherwise it logs "Invalid Year".
// enrollStudent: Enrolls a student in a course.
// addGrade: Adds the grade of a student for a course.
// getReportCard: Logs the grades of a student for all courses. If the course has no grade, it uses "In progress" as the grade.
// courseReport: Logs the grades of all students for a given course name. Only student with grades are part of the course report.
// To test your code, use the three student objects listed below. Using the three student objects, produces the following values from the getReportCard and courseReport methods respectively.

function createSchool() {
  var students = [];

  function findStudent(studentName) {
    return students.filter(function(student) {
      return student.name === studentName;
    })[0];
  }

  return {
    addStudent: function(name, year) {
      var validYears = ['1st', '2nd', '3rd', '4th', '5th'];
      var newStudent;

      if (validYears.includes(year)) {
        newStudent = createStudent(name, year);
        students.push(newStudent);
        return newStudent;
      } else {
        console.log('Invalid year.');
      }
    },
    enrollStudent: function(student, course) {
      var currentStudent = findStudent(student.name);

      currentStudent.addCourse(course);
    },
    addGrade: function(student, courseName, grade) {
      var currentStudent = findStudent(student.name);

      currentStudent.courses.filter(function(course) {
        return course.name === courseName;
      })[0]['grade'] = grade;
    },
    getReportCard: function(student) {
      var currentStudent = findStudent(student.name);

      currentStudent.courses.forEach(function(course) {
        var grade = course.grade ? course.grade : 'In progress';
        console.log(course.name + ': ' + grade);
      });
    },
    courseReport: function(courseName) {
      function findCourse(course) {
        return courseName === course.name;
      }

      function courseData(students) {
        var data = [];

        students.forEach(function(student) {
          data.push({
            name: student.name,
            grade: student.courses.filter(findCourse)[0].grade,
          });
        });

        return data;
      }

      function average(grades) {
        return grades.reduce(function(sum, current) {
          return sum + current;
        }) / grades.length;
      }

      var enrolledStudents = students.filter(function(student) {
        if (student.courses.some(findCourse)) return student;
      });
      var namesAndGrades = courseData(enrolledStudents);
      var courseAverage = average(namesAndGrades.map(function(student) {
        return student.grade === undefined ? 0 : student.grade;
      }));

      if (courseAverage === 0) {
        console.log(undefined);
        return;
      }

      console.log('=' + courseName + ' Grades=');
      namesAndGrades.forEach(function(student) {
        console.log(student.name + ': ' + student.grade);
      });

      console.log('---');
      console.log('Course Average: ' + courseAverage);
    },
  };
}

function createStudent(name, year) {
  return {
    name: name,
    year: year,
    courses: [],
    info: function() {
      console.log(this.name + ' is a ' + this.year + ' year student.');
    },
    addCourse: function(course) {
      this.courses.push(course);
    },
    listCourses: function() {
      console.log(this.courses);
    },
    addNote: function(code, note) {
      let course = this.courses.filter(function(course) {
        return course.code === code;
      })[0];

      if (course.hasOwnProperty('notes')) {
        course.notes.push(note);
      } else {
        course.notes = [note];
      }
    },
    updateNote: function(code, note) {
      let course = this.courses.filter(function(course) {
        return course.code === code;
      })[0];

      if (course) {
        course.notes = [note];
      }
    },
    viewNotes: function() {
      let coursesWithNotes = this.courses.filter(function(course) {
        return course.hasOwnProperty('notes');
      });

      coursesWithNotes.forEach(function(course) {
        console.log(course.name + ': ' + course.notes.join('; '));
      });
    },
  }
}

var school = createSchool();

var foo = school.addStudent('foo', '3rd');
school.enrollStudent(foo, { name: 'Math', code: 101 });
school.enrollStudent(foo, { name: 'Advanced Math', code: 102 });
school.enrollStudent(foo, { name: 'Physics', code: 202, });
school.addGrade(foo, 'Math', 95);
school.addGrade(foo, 'Advanced Math', 90);

var bar = school.addStudent('bar', '1st');
school.enrollStudent(bar, { name: 'Math', code: 101 });
school.addGrade(bar, 'Math', 91);

var qux = school.addStudent('qux', '2nd');
school.enrollStudent(qux, { name: 'Math', code: 101 });
school.enrollStudent(qux, { name: 'Advanced Math', code: 102 });
school.addGrade(qux, 'Math', 93);
school.addGrade(qux, 'Advanced Math', 90);

console.log(foo);
console.log(bar);
console.log(qux);

school.getReportCard(foo);

school.courseReport('Math');
school.courseReport('Advanced Math');
school.courseReport('Physics');
