// Working with Dates
// Let's do some practice problems with the Date object and its methods. You can refer to the MDN Documentation as you go through these.
//
// 1. Create a variable named today with the current date and time as its value.
var today = new Date();
console.log(today);

// 2. Log a string, "Today's day is 5", that tells the current day of the week as a number between 0 and 6 (Sunday is 0, Saturday is 6). Use the getDay method to obtain the number of the day of week.
var today = new Date();
console.log("Today's day is " + String(today.getDay()));

// 3. The getDay method, like many of the get methods on the date object, returns a zero-based index of the current day of week instead of the day name. This enables support for multiple locales and formats. Modify the output message of the previous problem to show the 3-letter day name abbreviation. You may use the following array:

var daysOfWeek = ['Sun', 'Mons', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

console.log("Today's day is " + daysOfWeek[today.getDay()]);

// 4. Let's add the calendar date (the day of month) to our log message: "Today's date is Mon, the 6th". Use the getDate method to obtain the current day of month. Don't worry about using different suffixes for numbers that end with 1, 2, or 3 just yet; we'll deal with that in the next problem.

console.log("Today's date is " + daysOfWeek[today.getDay()] + " the " + String(today.getDate()) + "th");

// 5. Ideally, the suffix on the day number needs to adjust to the proper suffix for days like the 1st, 22nd, and 3rd. Write a function named dateSuffix that takes the day of month as a numeric value and returns the formatted day of month and suffix. Make sure you use the correct suffixes.

// Input: Day of the month as numeric value
// Output: Formatted day of month and suffix

// Algorithm
// 1st
// 2nd
// 3rd
// 21st
// 22nd
// 23rd
// 31st
//
// if date is 1 or 21 or 31
//   return st
// else if date is 2 or 22
//   return nd
// else if date is 3 or 23
//   return rd
// else
//   return th

// return day of month + suffix

function dateSuffix(day) {
  var suffix = '';

  if ((day === 1) || (day === 21) || (day === 31)) {
    suffix = 'st';
  } else if ((day === 2) || (day === 22)) {
    suffix = 'nd';
  } else if ((day === 3) || (day === 23)) {
    suffix = 'rd';
  } else {
    suffix = 'th';
  }

  return String(day) + suffix;
}

// 6. Change your output to include the value from the getMonth method. Thus, the logged string will read "Today's date is Mon, 11 6th", where 11 is the month number returned by getMonth.

console.log("Today's date is " + daysOfWeek[today.getDay()] + ", " + String(today.getMonth()) + " " + dateSuffix(today.getDate()));

// 7. Let's make the month readable. Using the same technique we used in problem 3, convert the month number in the output string to a 3-letter month name abbreviation. You may use the following array:

var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

console.log("Today's date is " + daysOfWeek[today.getDay()] + ", " + months[today.getMonth()] + " " + dateSuffix(today.getDate()));

// 8. Our call to console.log is getting cluttered. Let's clean things up a bit and refactor the code into a few formatting functions that we can call from anywhere in our code. Create formattedMonth and formattedDay functions to format the month and day, then write a formattedDate function that pulls everything together and logs the fully formatted date.

// formattedMonth
// Input:
// Returns the formatted month
function formattedMonth(monthAsNumber) {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[monthAsNumber];
}

// formattedDay
// Returns the formatted day
function formattedDay(dayAsNumber) {
  var daysOfWeek = ['Sun', 'Mons', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return daysOfWeek[dayAsNumber];
}

// formattedDate
// Returns : today's date is formattedDay + formattedMonth + date
function formattedDate(currentDay) {
  // get the day of the week
  var day = formattedDay(currentDay.getDay());
  // get the month
  var month = formattedMonth(currentDay.getMonth());
  // get the date + suffix
  var date = dateSuffix(currentDay.getDate());
  // output today's date is...

  console.log("Today's date is " + day + ", " + month + " " + date);
}

formattedDate(today);

// 9. Log the values returned from the getFullYear and getYear methods. Note how these values differ. Note especially that getYear is deprecated: you should avoid using deprecated methods as they may one day disappear.
console.log(today.getYear());
console.log(today.getFullYear());

// 10. Use the getTime method and log the current date and time in total milliseconds since Jan. 1st 1970.
console.log(today.getTime());

// 11. Create a new date object variable named tomorrow that contains a Date object. Initialize the variable by setting it to the value of today. You can get the value of today using the getTime method. Next, change the date on the tomorrow object to the day after today: you should use setDate to change the date. Finally, log the tomorrow object with your formattedDate function.
var tomorrow = new Date(today.getTime());
tomorrow.setDate(tomorrow.getDate() + 1);
formattedDate(tomorrow);

// 12. Create a new variable named nextWeek that is a new Date copied from the today object. Compare nextWeek and today, and log the results. Are they equal? Why or why not?
var nextWeek = new Date(today.getTime());
// This is false because nextWeek and today are different objects
console.log(nextWeek === today);

// 13. The === operator only returns true with Date objects if the objects are the same object. Since we have two different objects (with the same values), we must instead compare the values represented by those objects. Compare the values returned by toDateString to determine whether the two objects are equal. Finally, add 7 days to the nextWeek date and compare the two objects again.
console.log(today.toDateString() === nextWeek.toDateString());
nextWeek.setDate(today.getDate() + 7);
console.log(today.toDateString() === nextWeek.toDateString());

// 14. Finally, write a function named formatTime that takes a date object as an argument and returns a string formatted with the hours and minutes as "15:30". Make sure you handle the case where the hours or minutes has only one digit: you need to pad the value with a leading zero in such cases, e.g., "03:04". You can use the getHours and getMinutes methods to obtain the hours and minutes.
// Input: A date object
// Output: Return a string with hours and minutes

// Get hours of date object and convert to a string
// Get minutes of date object and convert to a String
// If hours has only one digit
//   append 0
// If minutes has only one digit
//   append 0
// Return hours : minutes

function formatTime(date) {
  var hours = String(date.getHours());
  var minutes = String(date.getMinutes());

  if (hours.length === 1) {
    hours = '0' + hours;
  }

  if (minutes.length === 1) {
    minutes = '0' + minutes;
  }

  console.log(hours + ':' + minutes);
}

formatTime(new Date(2013, 2, 1, 1, 0));
