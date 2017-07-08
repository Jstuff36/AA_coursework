import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {date: new Date()};
    this.tick = this.tick.bind(this);
    this.handle = "";

  }

  tick() {
    let date = new Date();
    this.setState({date});
  }

  componentDidMount() {
    this.handle = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.handle);
  }

  render() {
    let date = this.state.date;
    return (
      <div>
        <h1>Clock</h1>
        <span className="clock">
          TIME: {date.getHours()}:{(date.getMinutes() < 10 ? '0' :'') + date.getMinutes() }:{(date.getSeconds() < 10 ? '0' :'') + date.getSeconds() }
        </span>
        <span className="date">
          DATE: {date.getMonth()}-{date.getDate()}-{date.getFullYear()}
        </span>
      </div>
    );
  }

}

export default Clock;
