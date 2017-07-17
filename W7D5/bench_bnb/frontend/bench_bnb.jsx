import React from 'react';
import ReactDOM from 'react-dom';
import * as utils from './util/session_api_util';
import configureStore from './store/configure_store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();

  //debugging
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  //end debugging

  ReactDOM.render(<Root store= { store } />, root);
});

//debugging
window.util = utils;
