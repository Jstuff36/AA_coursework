import React from 'react';
import { uniqueId } from '../../util/utils';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false,
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    event.preventDefault();

    this.props.createTodo({
      id: uniqueId(),
      title: this.state.title,
      body: this.state.body,
      done: this.state.done
    }).then( () =>
    this.setState({
      title: "",
      body: "",
      done: false
    }));
  }

  handleChange(key) {
    return (event => this.setState({[key]: event.currentTarget.value}));
  }

  render() {
    return (
      <form>
        <input type="text" name="title" onChange={this.handleChange("title")} value={this.state.title}/>
        <input type="text" name="body" onChange={this.handleChange("body")} value={this.state.body}/>
        <input type="hidden" name="done" value={this.state.done}/>
        <input type="button" value="Submit" onClick={this.handleClick} />
      </form>
    );
  }
}


export default TodoForm;
