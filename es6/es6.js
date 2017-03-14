

(function func1() {
  if (true) {
    var tmp = 123;
  }
  console.log("func1 tmp", tmp);
}());

(function func2() {
  let foo = 5;
  if (true) {
    let foo = 10;
    console.log("foo inside if block", foo);
  }
  console.log("func2 with let", foo);
}());
//
// const MAX_CAT_SIZE = {weight: 3000};
// MAX_CAT_SIZE.weight = 5000;
// console.log("max cat", MAX_CAT_SIZE);
//
// var reflect = function(value) {
//   return value;
// };
//
// const reflect = (value) => value;

//var numbers = [1,2,3,4,5];
// var timesTwo = numbers.map(function(number){
//   return number * 2;
// });
// console.log(timesTwo);

// let timesTwo = numbers.map((number) => number * 2);
// console.log(timesTwo);

// function FooCtrl (FooService) {
//   this.foo = "Hello";
//   FooService.doSomething(function(response) {
//     this.foo = response;
//   }).bind(this)
// }

// const wow = "Hi there",
//   es6 = "ES6",
//   myNum = ()=> console.log("howdy");
//
//   let myOldObj = {
//     wow:wow,
//     es6:es6,
//     myNum:myNum
//   };let  myNewObj = {wow,es6, myNum};
//   console.log("myNewObj", myNewObj);


const dog = {
  name: "Bingo",
  breed: "Mutt",
  speak: () => "woof"
}

const myDog = dog.name;

const { name: myName, speak } = dog;
console.log("my Dog name", myName, "my dog say", speak());

let x = [1,2,3,4,5];
let[y,z] = x;
console.log(y,z);

let countries = ['ussr', 'uk'];
let moreCountries = ['Canada', 'Mexico'];
let un = [...countries, ...moreCountries];
console.log('un', un);


var arr = [1,2,3,4,5];
for (let elem of arr) {
  console.log(elem);
};
