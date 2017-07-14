import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {

  componentDidMount() {
    this.props.fetchTodos();
  }

  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.todos.map((todo, idx) => (
            <TodoListItem todo={todo} key={idx} deleteTodo={this.props.deleteTodo} updateTodo={this.props.updateTodo}/>
          ))}
        </ul>
        <TodoForm createTodo={this.props.createTodo}/>
      </div>

    );
  }
}

export default TodoList;
