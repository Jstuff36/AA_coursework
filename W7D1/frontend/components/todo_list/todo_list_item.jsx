import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }

  handleClick(event) {
    event.preventDefault();
    this.props.deleteTodo(this.props.todo);
  }

  updateTodo(event){
    event.preventDefault();
    this.toggleDone();
    this.props.updateTodo(this.props.todo);
  }

  toggleDone() {
    this.props.todo.done = !this.props.todo.done;
  }

  render() {
    return (
      <li>
        {this.props.todo.title}
        <button onClick={this.handleClick}>Delete item</button>
        <button onClick={this.updateTodo}>{this.props.todo.done ? "Undo": "Done"}</button>
      </li>
    );
  }
}

export default TodoListItem;
