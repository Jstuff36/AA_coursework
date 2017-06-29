function range(start, end) {
  let rangeArr = [start];
  if (start === end) {
    return end;
  }
  return rangeArr.concat(range(start+1, end));
}

console.log(range(3, 5));

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }
  return arr[0] + sumRec(arr.slice(1));
}

console.log(sumRec([1,2,3]));

function exponent(base, exp) {
  if (exp === 0){
    return 1;
  }
  return base * (exponent(base, exp - 1));
}

console.log(exponent(2, 4));

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }
  if (exp % 2 === 0){
    return Math.pow(exponent2(base, exp/2), 2);
  }
  else {
    return base * Math.pow(exponent2(base, (exp-1)/2), 2);
  }

}

console.log(exponent2(2,3));

function fibonacci(n) {
  if (n === 0) {
    return [];
  }
  else if (n === 1) {
    return [0];
  }
  else if (n === 2) {
    return [0, 1];
  }
  let fib = fibonacci(n-1);
  let sum = fib[fib.length - 1] + fib[fib.length - 2];
  return fib.concat([sum]);
}

console.log(fibonacci(5));

function bsearch(arr, target) {
  let mid = arr.length/2;
  if (arr[mid] === target) {
    return mid;
  }
  else if (arr[mid] > target) {
    return bsearch(arr.slice(0, mid));
  }
  else {
    return mid + bsearch(arr.slice(mid+1));
  }
}

console.log(bsearch([1,2,3,4,5,6,7], 6));

function mergesort(arr) {
  if (arr.length < 2) {
    return arr;
  }
  let mid = arr.length/2;
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);
  let leftSorted = mergesort(left);
  let rightSorted = mergesort(right);
  return merge(leftSorted, rightSorted);
}

function merge(left, right){
  let mergedArr = [];
  console.log(left.length);
  while (true) {
    console.log(right);
    if (left.length === 0 || right.length === 0) {
      break;
    }
    ((left[0] < right[0]) ? mergedArr.push(left.shift()) : mergedArr.push(right.shift()));
  }
  return mergedArr.concat(left).concat(right);
}

console.log(mergesort([5,3,2,6,9,1,4]));

function subsets(arr) {
  if (arr.length === 0) {
    return [[]]
  }

}
