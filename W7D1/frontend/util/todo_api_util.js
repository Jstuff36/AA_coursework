export const apiUtilGet = () => {
  return $.ajax({ method: 'GET', url: '/api/todos' });
};

export const apiUtilPost = (newTodo) => {
  return $.ajax({ method: 'POST', url: '/api/todos', data: {todo: newTodo }});
};

export const apiUtilUpdate = (todo) => {
  return $.ajax({ method: 'PATCH', url: `/api/todos/${todo.id}`, data: {todo}});
};

export const apiUtilDelete = (todo) => {
  return $.ajax({ method: 'DELETE', url: `/api/todos/${todo.id}`, data: {todo}});
};
