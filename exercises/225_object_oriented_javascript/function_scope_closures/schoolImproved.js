// School Improved
// In an earlier exercise, we created a school object. It works, however, it can still be improved. The following are improvements for you to implement:
//
// * Make the list students private. Right now, anyone can gain access to it and manipulate it.
// * Make the constraint for allowed values for years private variable. As a private variable it avoids an unnecessary statement in the addStudent method and at the same time makes the code more declarative.
// Make the getCourse function accessible in the addGrade method also. As it is, only the courseReport method has access.

var school = (function() {
  var students = [];
  var allowedYears = ['1st', '2nd', '3rd', '4th', '5th'];

  function getCourse(student, courseName) {
    return student.listCourses().filter(function(course) {
      return course.name === courseName;
    })[0];
  }

  return {
    addStudent: function(name, year) {
      if (allowedYears.indexOf(year) >= 0) {
        var student = createStudent(name, year);
        students.push(student);
        return student;
      } else {
        console.log('Invalid Year');
      }
    },

    enrollStudent: function(student, courseName, courseCode) {
      student.addCourse({name: courseName, code: courseCode})
    },

    addGrade: function(student, courseName, grade) {
      var course = getCourse(student, courseName);

      if (course) {
        course.grade = grade;
      }
    },

    getReportCard: function(student) {
      student.listCourses().forEach(function(course) {
        if (course.grade) {
          console.log(course.name + ': ' + String(course.grade));
        } else {
          console.log(course.name + ': In progress');
        }
      });
    },

    courseReport: function(courseName) {
      var courseStudents = students.map(function(student) {
        var course = getCourse(student, courseName) || { grade: undefined };
        return { name: student.name, grade: course.grade };
      }).filter(function(student) {
        return student.grade;
      });

      if (courseStudents.length > 0) {
        console.log('=' + courseName + ' Grades=');

        var average = courseStudents.reduce(function(total, student) {
          console.log(student.name + ': ' + String(student.grade));
          return total + student.grade;
        }, 0) / courseStudents.length;

        console.log('---');
        console.log('Course Average: ' + String(average));
      }
    },
  }
})();

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
      return this.courses;
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

var foo = school.addStudent('foo', '3rd');
school.enrollStudent(foo, 'Math', 101 );
school.enrollStudent(foo, 'Advanced Math', 102 );
school.enrollStudent(foo, 'Physics', 202, );
school.addGrade(foo, 'Math', 95);
school.addGrade(foo, 'Advanced Math', 90);

var bar = school.addStudent('bar', '1st');
school.enrollStudent(bar, 'Math', 101 );
school.addGrade(bar, 'Math', 91);

var qux = school.addStudent('qux', '2nd');
school.enrollStudent(qux, 'Math', 101);
school.enrollStudent(qux, 'Advanced Math', 102 );
school.addGrade(qux, 'Math', 93);
school.addGrade(qux, 'Advanced Math', 90);

console.log(foo);
console.log(bar);
console.log(qux);

school.getReportCard(foo);

school.courseReport('Math');
school.courseReport('Advanced Math');
school.courseReport('Physics');
