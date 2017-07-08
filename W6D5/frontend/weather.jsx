import React from 'react';

class Weather extends React.Component {
  constructor() {
    super();
    this.state = {weather: ""};
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition( function(pos) {
      let latitude = pos.coords.latitude;
      let longitude = pos.coords.longitude;
      let apiReq = `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=d8786bbb5109d8f2ad87f8d275b6b509`
      let request = new XMLHttpRequest();

      request.onload = () => {
        console.log(request.responseText);
        if (request.readyState == XMLHttpRequest.DONE ) {
          debugger;
          let that = this;
          if (request.status == 200) {
            this.setState({weather: request}).bind(that);
          } else {
            alert("asdf");
          }
        }
      };
      request.open('GET', apiReq, true);
      request.send();

    });
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
