"use strict";

// set to node by default, it can be set to anything you want, and will be 
// what gets displayed in lists of running processes. 
process.title = 'Dice Roll';

const { argv: [,, ...args] } = process,
      { count, sides } = require('./parse-args')(args),
      { roll, toDiceNotation } = require('./dice');

const dice = toDiceNotation({count, sides}),
      total = roll(dice);

console.log(total);
