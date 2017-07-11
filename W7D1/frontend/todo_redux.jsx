import React from "react";
import ReactDOM from "react-dom";

import Root from "./components/root";
import configureStore from "./store/store";
import { App } from './components/app';

import { receiveTodos } from "./actions/todo_actions";
import { receiveTodo } from "./actions/todo_actions";
import { allTodos } from "./reducers/selectors";


document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, main);

  window.store = store;
  window.todo = {
      id: 3,
      title: "Fight a lion in space",
      body: "For the children",
      done: false
  };
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.allTodos = allTodos;
});
