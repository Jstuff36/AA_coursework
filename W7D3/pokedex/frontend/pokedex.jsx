import React from 'react';
import ReactDOM from 'react-dom';

import * as APIUtil from "./util/api_util";
import * as Actions from "./actions/pokemon_actions";
import configureStore from './store/store.js';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<div>i wrote this</div>, document.getElementById('root') );
  let store = configureStore();
  window.store = store;
  window.dispatch = store.dispatch;
  window.getState = store.getState;
  

});

window.APIUtil = APIUtil;
window.Actions = Actions;
