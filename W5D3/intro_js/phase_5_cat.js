class Cat {
  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }
}

Cat.prototype.cuteStatement = function() {
  return this.owner + " loves " + this.name;
};

const harry = new Cat("harry", "Jim");

console.log(harry.cuteStatement());

Cat.prototype.cuteStatement = function() {
  return "Everyone loves " + this.name;
};

console.log(harry.cuteStatement());

Cat.prototype.meow = function() {
  return "meow meow";
};

harry.meow = function() {
  return "MEOW MEOW MEOW";
};

console.log(harry.meow());

const larry = new Cat("larry", "Tim");

console.log(larry.meow());
