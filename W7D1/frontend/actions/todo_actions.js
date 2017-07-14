import { apiUtilGet, apiUtilPost, apiUtilUpdate, apiUtilDelete } from "../util/todo_api_util";

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo
  };
};

export const removeTodo = (todo) => {
  return {
    type: REMOVE_TODO,
    todo
  };
};

export const fetchTodos = () => {
  return (dispatch) => {
    return apiUtilGet().then( resp => dispatch(receiveTodos(resp)));
  };
};

export const createTodo = (todo) => {
  return (dispatch) => {
    return apiUtilPost(todo).then( resp => dispatch(receiveTodo(todo)));
  };
};

export const updateTodo = (todo) => {
  return (dispatch) => {
    return apiUtilUpdate(todo).then( resp => dispatch(receiveTodo(todo)));
  };
};

export const deleteTodo = (todo) => {
  return (dispatch) => {
    return apiUtilDelete(todo).then( resp => dispatch(removeTodo(todo)));
  };
};
