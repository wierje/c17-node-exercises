#!/usr/bin/env node

"use strict";

const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('acme.sqlite', (err) => console.log('Connected'));
console.log(db);

const createEmployeesTable = () => {
    db.run("CREATE TABLE IF NOT EXISTS employees(id INT, firstname TEXT, lastname TEXT, jobtitle TEXT, address TEXT)");
};

let acmeArray = [
    { id: 0, firstName: 'Fred', lastName: 'Smith', jobTitle: 'Cashier', address: '500 Somewhere Lane' },
    { id: 1, firstName: 'James', lastName: 'West', jobTitle: 'Salesman', address: '500 Interstate Blvd S' },
    { id: 2, firstName: 'Donald', lastName: 'Drumpf', jobTitle: 'Janitor', address: '1600 Pennsylvania Ave' },
    { id: 3, firstName: 'James', lastName: 'Wier', jobTitle: 'COO', address: '500 Nowhere Lane' },
    { id: 4, firstName: 'Michelle', lastName: 'Obama', jobTitle: 'First Lady', address: '500 Outtahere Street' },
    { id: 5, firstName: 'Barack', lastName: 'Obama', jobTitle: 'President', address: '500 Nextlife Lane' },
]

db.run(`INSERT INTO employees VALUES(acmeArray)`);