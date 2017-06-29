Array.prototype.bubbleSort = function() {
  for (let i = 0; i < this.length; i++) {
    for(let j = i + 1; j < this.length-1; j++){
      if (this[i] > this[j]) {
        let temp = this[i];
        this[i] = this[j];
        this[j] = temp;
      }
      console.log(this);
    }
  }
  return this;
};
let bubble = [3,2,4,1,5].bubbleSort();
console.log(bubble);

String.prototype.substrings = function() {
  let substrings = [];
  for (let i = 0; i < this.length; i++) {
    for(let j = i + 1; j <= this.length; j++){
      substrings.push((this.slice(i, j)));
    }
  }
  return substrings;
};

console.log("under pressure".substrings());
