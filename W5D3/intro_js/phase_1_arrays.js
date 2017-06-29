Array.prototype.uniq = function() {
  let newArr = [];
  for (let i = 0; i < this.length; i++) {
    if (!newArr.includes(this[i])) {
      newArr.push(this[i]);
    }
  }
  return newArr;
};

let arr = [1, 2, 2, 3];
console.log(arr.uniq());

Array.prototype.twoSum = function(){
  let newArr = [];
  let i = 0;

  while (i < this.length){
    let j = (i + 1);

    while (j < this.length) {
      if (this[i] + this[j] === 0) {
        newArr.push([i, j]);
      }
      j += 1;
    }
    i += 1;
  }
  return newArr;
  // let newArr = [];
  // for(let i = 0; i < this.length; i++) {
  //   for(let j = (i+1); j < this.length; j++) {
  //     if (this[i] + this[j] === 0){
  //       newArr.push([i,j]);
  //     }
  //   }
  // }
  // return newArr;
};

let arr1 = [1, -1, 3, -3];


Array.prototype.transpose = function(){
  let newArr = [];
  for (let i = 0; i < this[0].length; i++ ) {
    newArr.push([]);
  }
  for (let i = 0; i < this.length; i++) {
    for(let j = 0; j < this[i].length; j++){
      newArr[i].push(this[j][i]);
    }
  }
  return newArr;
};

let arr4 = [[1,2], [4, 8]];
