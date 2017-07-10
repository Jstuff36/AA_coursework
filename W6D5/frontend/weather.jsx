import React from 'react';

class Weather extends React.Component {
  constructor() {
    super();
    this.state = {weather: ""};
  }

  getWeather(pos) {
    let latitude = pos.coords.latitude;
    let longitude = pos.coords.longitude;
    let apiReq = `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=f816d7f39052e3a98b21952097a43076`
    let request = new XMLHttpRequest();
    request.onreadystatechange = () => {
      if (request.readyState == XMLHttpRequest.DONE && request.status == 200) {
        this.setState({weather: request});
      }
    };
    request.open('GET', apiReq, true);
    request.send();
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.getWeather.bind(this));
  }

  componentWillUnmount() {

  }

  render() {
    return (
      <div>
        <h1>{this.state.weather.name}</h1>
      </div>
    );
  }
}

export default Weather;
