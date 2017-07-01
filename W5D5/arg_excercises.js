//write a sum function using arguments keyword
let sum = function() {
  let total = 0;
  Array.from(arguments).forEach((el) => {
    total += el;
  });
  return total;
};

console.log(sum(1,2,3));

//write a sum function using the rest operator
let SumWithRest = function(...args) {
  let total = 0;
  args.forEach((el) => {
    total += el;
  });
  return total;
};

console.log(SumWithRest(1,2,3));


//Write a myBind method that can take both bind_time arguments and call-time arguments

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

Function.prototype.myBind = function() {
  console.log(this);
  let that = this;
  let args = Array.from(arguments);
  let bindToThis = args.shift();
  return function() {
    args.push(Array.from(arguments));
    that.apply(bindToThis, args);
  };
};
markov.says.myBind(breakfast, "meow")("Markov");

//Write a curried functin that sums integers

function curriedSum(numArgs) {
  let sumThese = [];
  return function innerCurry(num) {
    sumThese.push(num);
    if (sumThese.length === numArgs) {
      let total = 0;
      sumThese.forEach( (el) => {
        total += el;
      });
      return total;
    } else {
      return innerCurry;
    }
  };
}

let total = curriedSum(4);
sum(5)(30)(20)(1);
