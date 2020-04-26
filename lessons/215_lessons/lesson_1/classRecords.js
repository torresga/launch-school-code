// Each term:
// 4 exams and several exercises
//
// Each exam:
// - fixed max score of 100
//
// Each exercises:
// - varied maximum score
// - there are a variable number of exercises
// - total maximum points for all exercises is 100 (so if there are 20 exercises, the max score is 100, if there are only five exercises, the max score is still 100)
//
// To determine a student's grade:
// - determine the student's average score from the four exams (score1 + score2 + score3 + score4) / 4
// - Add all the exercise scores
// - Add weights to scores = average of exam * .65, sum of exercise scores * .35 and add the values together
// - Round the percent grade to the nearest integer
// - Return letter grade
// - Combine the percent grade and letter grade
//
// Input:
// An object of student scores. Each key is a student, each value is an object containing:
// - the id of the student
// - scores for the student:
//   - 4 exam scores
//   - 5 exercise scores (but the count of scores can vary, per the problem explanation)
//
//   Output:
//   A new object with two keys, 'studentGrades' and 'exams'.
//
//   'studentGrades' has a value of an array: that contains the percent grade and the letter grade for each student.
//
//   'exams' has a value of an array: each element of the array is an object that contains data for each exam. Each object contains the average for each exam, the minimum score, and the maximum score.
//
//   Problems to solve:
//
//   studentGrade:
//   Input: An array of exam scores, an array of exercise scores
//   Output: A string containing the final grade (both percent and letter)
//   1. Determine each student's final grade.
//   3. Create a string that contains the student's final grade and the letter score
//
//   examAverage:
//   Input: An array of exam scores
//   Output: An object containing the average, minimum, and maximum score
//   2. For each exam, find the average score, the minimum score, and the max score
//
//   generateClassRecordSummary:
//   Input: An object of students
//   Output: An object containing student grades and exam averages
//   4. Create an object with the studentGrades and the exam data.
//
//   Helper methods:
//   1. Extract scores for each exam (where each exam has the same element index) - return an array of scores for each exam
//
//   2. average exam score - calculate average exam score for each student
//   3. total exercise score - calcualte total exercise score for each student
//   4. determine final percent grade
//   5. find letter grade
//
//   Algorithm:
//
// -------
//   studentGrade:
//   1. Determine each student's final grade:
//     1. Calculate average exam score
//     2. Calculate total exercise score
//     3. Determine final percent grade
//     4. Find letter grade
//     5. Return percent grade and letter grade in this form - 'percent (letter)'
//
//   Helper methods for studentGrade:
//   1. Calculate average exam score:
//     Input: An array of scores
//     Output: a Number
//     Algorithm: (score1 + score2 + score3 + score4) / 4
//
//   2. Calculate total exercise score:
//     Input: An array of exercises
//     Output: A number
//     Algorithm: Add all exercise scores together
//
//   3. Determine final percent grade:
//     Input: average of exam, sum of exercise scores
//     Output: a number
//     Algorithm:
//     0. Declare .35 as a constant for exercise weight
//     1. Declare .65 as a constant for exam weight
//     2. Multiply average of exam scores * exam weight
//     3. Multiple sum of exercise scores * exercise weight
//     4. Add values together
//     5. Round the percent grade to the nearest integer
//     6. Return the percent grade
// --------
//
//   examAverage:
//     1. Find average score - can use helper calculateAverageExamScore
//     2. Find minimum score
//     3. Find maximum score
//     4. Return an object:
//     {
//       average: average,
//       minimum: minimum,
//       maximum: maximum
//     }
//
//     Helper methods for examAverage:
//     1. Find minimum score:
//     Input: An array of scores
//     Output: A number
//     Algorithm:
//     1. Reduce the array by the minimum score
//
//     2. Find maximum score:
//     Input: an array of scores
//     Output: a Number
//     Algorithm:
//     1. Reduce the array by the maximum score
//     -----------
//
//     generateClassRecordSummary:
//     1. Create an array for student grades
//     2. Create an array for exams
//     3. Loop through each student's scores
//     4.   Create student grade and add to student grades
//     5.   Add current exam element to the exams array
//     6. Return a new object:
//     {
//       studentGrades: student grades
//       exams: an array of exam Averages
//     }

function averageExamScore(scores, scoreCount) {
  return scores.reduce(function(sum, score) {
    return sum + score;
  }) / scoreCount;
}

function totalExerciseScore(scores) {
  return scores.reduce(function(sum, score) {
    return sum + score;
  });
}

function percentGrade(examAverage, exerciseScores) {
  const exerciseWeight = .35;
  const examWeight = .65;

  let exercisesPercent = exerciseWeight * exerciseScores;
  let examsPercent = examWeight * examAverage;

  return Math.round(exercisesPercent + examsPercent);
}

function letterGrade(percentGrade) {
  if (percentGrade >= 93 && percentGrade <= 100) {
    return 'A';
  } else if (percentGrade >= 85 && percentGrade <= 92) {
    return 'B';
  } else if (percentGrade >= 77 && percentGrade <= 84) {
    return 'C';
  } else if (percentGrade >= 69 && percentGrade <= 76) {
    return 'D';
  } else if (percentGrade >= 60 && percentGrade <= 68) {
    return 'E';
  } else if (percentGrade <= 59) {
    return 'F';
  }
}

function studentGrade(examScores, exerciseScores) {
  let averageForExams = averageExamScore(examScores, 4);
  let exerciseTotal = totalExerciseScore(exerciseScores);
  let percent = percentGrade(averageForExams, exerciseTotal);
  let letter = letterGrade(percent);

  return `${percent} (${letter})`;
}

function minScore(scores) {
  return scores.reduce(function(score1, score2) {
    return Math.min(score1, score2);
  });
}

function maxScore(scores) {
  return scores.reduce(function(score1, score2) {
    return Math.max(score1, score2);
  });
}

function examAverage(scores) {
  let average = averageExamScore(scores, 5);
  let min = minScore(scores);
  let max = maxScore(scores);

  return {
    average: average,
    min: min,
    max: max,
  };
}

function getListOfExamScores(scores) {
  let individualExamScores = [];
  let allScores = Object.values(scores).map(function(elem) {
    return elem.scores.exams;
  });

  for (let i = 0; i < allScores.length - 1; i += 1) {
    let inner = [];
    for (let j = 0; j < allScores.length; j += 1) {
      inner.push(allScores[j][i]);
    }

    individualExamScores.push(inner);
  }

  return individualExamScores;
}

function generateClassRecordSummary(scores) {
  let studentGrades = [];
  let exams = getListOfExamScores(scores);

  for (student in scores) {
    studentGrades.push(studentGrade(scores[student].scores.exams, scores[student].scores.exercises));
  }

  let averages = exams.map(function(exam) {
    return examAverage(exam);
  });

  return {
    studentGrades: studentGrades,
    exams: averages,
  };
}

// 1. Get student grades in a nested array: [[student1], [student2], etc]
// 2. Get exercises in a nested array.
// 3. Map student grades and exercises into studentGrade
// 4. Get student grades in a different way - all zeroeth elements, first elements, second, etc together in a new array
// 5. Return a new object:
// {
//   studentGrades: studentGrades
//   exams: examAverage for each grade
// }


let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassRecordSummary(studentScores));
