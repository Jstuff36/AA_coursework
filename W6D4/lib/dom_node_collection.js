class DOMNodeCollection {
  constructor(arrayOfHTMLements) {
    this.arrayOfHTMLements = arrayOfHTMLements;
  }

  html(string) {
    if (!string) {
      return this.arrayOfHTMLements[0].innerHTML;
    } else {
      for (let i = 0; i < this.arrayOfHTMLements.length; i++) {
        this.arrayOfHTMLements[i].innerHTML = string;
      }
    }
  }

  empty() {
    this.arrayOfHTMLements.forEach( (node) => {
      node.innerHTML = "";
    });
  }

  append(...htmlEls) {
    this.arrayOfHTMLements.forEach( (node) => {
      htmlEls.forEach( (htmlEl) => {
        let newNode = document.createElement(htmlEls);
        node.appendChild(newNode);
      });
    });
  }


  //doenst work yet
  attr(target) {
    this.arrayOfHTMLements.forEach ( (node) => {
      if (node.getAttribute(target)) {
        return(node.getAttribute(target));
      }
    });
  }

  addClass(newClass) {
    this.arrayOfHTMLements.forEach( (node) => {
      console.log(node);
      node.classList.add(newClass);
    });
  }

  removeClass(newClass) {
    this.arrayOfHTMLements.forEach( (node) => {
      node.classList.remove(newClass);
    });
  }

}

module.exports = DOMNodeCollection;
