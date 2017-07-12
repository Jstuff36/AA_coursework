import React from "react";
import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from "../actions/todo_actions";
import merge from "lodash/merge";

// const initialState = {
//   1: {
//     id: 1,
//     title: "save the dinosaurs",
//     body: "stop the meteor",
//     done: false
//   },
//   2: {
//     id: 2,
//     title: "punch a gorilla",
//     body: "in the face (avenge Harambe!)",
//     done: true
//   }
// };

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  const newState = merge({}, state);

  switch(action.type) {
    case RECEIVE_TODOS:
      const todos = {};
      action.todos.forEach((todo) => {
        todos[todo.id] = todo;
      });
      return todos;
    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return newState;
    case REMOVE_TODO:
      delete newState[action.todo.id];
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
