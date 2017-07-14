import React from "react";
import ReactDOM from "react-dom";

import Root from "./components/root";
import configureStore from "./store/store";
import { App } from './components/app';

import { receiveTodos, receiveTodo, removeTodo, fetchTodos }
  from "./actions/todo_actions";
import { allTodos } from "./reducers/selectors";
import { apiUtilGet } from "./util/todo_api_util";


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
  window.fetchTodos = fetchTodos;
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo;
  window.allTodos = allTodos;
  window.getThing = apiUtilGet;
});
