/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DomNodeCollection = __webpack_require__(1);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);