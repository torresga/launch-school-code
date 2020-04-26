// Space Design
// We're putting together some information about our new company Space Design. Not all roles have been filled yet. But although we have a CEO and Scrum Master, displaying them shows undefined. Why is that?

// Roles (salary still to be determined)

var ceo = {
  tasks: ['company strategy', 'resource allocation', 'performance monitoring'],
  salary: 0,
};

var developer = {
  tasks: ['turn product vision into code'],
  salary: 0,
};

var scrumMaster = {
  tasks: ['organize scrum process', 'manage scrum teams'],
  salary: 0,
};

// Team -- we're hiring!

var team = {};

// These three lines adds the object inside of each variable (ceo, developer, scrumMaster) as a key to the team object. Keys can only be strings? So the object is converted to a string - '[object Object]'. This string is being overwritten three times. The last value is undefined, so when we long team we have an object that looks like this: {'[object Object]': undefined}
team['ceo'] = 'Kim';
team['scrumMaster'] = 'Alice';
team['developer'] = undefined;

// console.log(team); {'[object Object]': undefined}

var company = {
  name: 'Space Design',
  team: team, // team looks like this: {'[object Object]': undefined}
  projectedRevenue: 500000,
};

console.log('----{ ' + company.name + ' }----');
console.log('CEO: ' + company.team['ceo']); //ceo turns into '[object Object], team['[object Object]'] is undefined'
console.log('Scrum master: ' + company.team['scrumMaster']); // scrumMaster turns into '[object Object], team['[object Object]'] is undefined'
console.log('Projected revenue: $' + company.projectedRevenue);

// ----{ Space Design }----
// CEO: undefined
// Scrum master: undefined
// Projected revenue: $500000
