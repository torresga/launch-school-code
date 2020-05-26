// Student
// Create an object factory for a student object. The student object should have the following methods and it should produce the expected results demonstrated in the sample code:

// info: Logs the name and year of the student.
// addCourse: Enrolls student in a course. A course is an object literal that has properties for its name and code.
// listCourses: Returns a list of the courses student has enrolled in.
// addNote: Adds a note property to a course. Takes a code and a note as an argument. If a note already exists, the note is appended to the existing one.
// updateNote: Updates a note for a course. Updating a note replaces the existing note with the new note.
// viewNotes: Logs the notes for all the courses. Courses without notes are not displayed.

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
      // Find object with the code name in the list of courses.
      // If object has a notes property
      //   Append note to existing notes
      // Else
      //   Create a note property and add note to it
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
      // Updates a note for a course. Updating a note replaces the existing note with the new note.

      // Find the course with that code
      // Assign the notes property with the new note
      let course = this.courses.filter(function(course) {
        return course.code === code;
      })[0];

      if (course) {
        course.notes = [note];
      }
    },
    viewNotes: function() {
      // Logs the notes for all the courses. Courses without notes are not displayed.
      // Find all the courses that have notes
      // Loop through the notes,
      //  Log: name of course, each note joined with a ;

      let coursesWithNotes = this.courses.filter(function(course) {
        return course.hasOwnProperty('notes');
      });

      coursesWithNotes.forEach(function(course) {
        console.log(course.name + ': ' + course.notes.join('; '));
      });
    },
  }
}

foo = createStudent('Foo', '1st');
foo.info();
// Foo is a 1st year student
foo.listCourses();
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// Math: Fun Course; Remember to study for algebra
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// Math: Fun Course; Remember to study for algebra
// Advanced Math: Difficult Subject
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// Math: Fun Course
// Advance Math: Difficult Subject
