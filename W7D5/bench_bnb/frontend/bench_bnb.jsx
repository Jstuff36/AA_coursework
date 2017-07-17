import React from 'react';
import ReactDOM from 'react-dom';
import * as utils from './util/session_api_util';
import configureStore from './store/configure_store';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  //debugging
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  ReactDOM.render(<h1>This is not a test</h1>, root);
});

//debugging
window.util = utils;
