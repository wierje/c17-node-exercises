"use strict";

const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('example.sqlite', (err) => console.log('Connected'));
console.log(db);
// const dropEmployees = () => {
//     db.run(`DROP TABLE employees`);
// };
// dropEmployees();
const createEmployeesTable = () => {
    db.run("CREATE TABLE IF NOT EXISTS employees(id INT, firstname TEXT, lastname TEXT, department TEXT, salary INT)");
};
// db.run(`INSERT INTO employees VALUES (0, "James", "Wier", 50000.00)`);

const populateEmployees = () => {
    const { list } = require('./employees.json');
    console.log(list);
    list.forEach(each => {
        db.run(`INSERT INTO employees VALUES(
        ${each.id},
        "${each.firstName}",
        "${each.lastName}",
        "${each.department}",
        ${each.salary}
            )`);
    })
};
populateEmployees();

// db.all(`SELECT * FROM employees`, (err, allRows) => {
//     allRows.forEach(({ id, firstName, lastName, department, salary }) => {
//         console.log(`${id}${firstName}${lastName}
//          from ${department}Department.
//          Salary:${salary}`);

//     })
// });

db.each(`SELECT * FROM employees`, (err, { id, firstname, lastname, department, salary }) => {
    if (err) {
        return console.log(err.toString);
    };

    console.log(`${id} ${firstname} ${lastname}
          from ${department} Department.
         Salary:${salary}`);
});