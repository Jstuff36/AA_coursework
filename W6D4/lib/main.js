const DomNodeCollection = require("./dom_node_collection");

function $l(oneArg) {
  if (typeof(oneArg === 'string')) {
    let nodeList = document.querySelectorAll(oneArg);
    let nodeArray = Array.from(nodeList);
    return new DomNodeCollection(nodeArray);
  } else if (oneArg instanceof HTMLElement) {
    return new DomNodeCollection([oneArg]);
  }
}

window.$l = $l;
