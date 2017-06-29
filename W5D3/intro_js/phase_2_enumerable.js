Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

[1,2,3].myEach(function(el) {
  console.log(el);
});

Array.prototype.myMap = function(callback) {
  let newArr = [];
  this.myEach(function(el) {
      newArr.push(callback(el));
  });
  return newArr;
};

let myVar = [1,2,3].myMap(function(otherEl) {
  return(otherEl + 1);
});

console.log(myVar);

Array.prototype.myReduce = function(callback, defaultVal) {
  let i = 0;
  if (defaultVal === undefined) {
    defaultVal = this[0];
    i = 1;
  }
  while (i < this.length) {
    defaultVal += callback(this[i]);
    i += 1;
  }
  return defaultVal;
};

let temp = [1,2,3].myReduce(function(el) {
  return el;
}, 2);

console.log(temp);
