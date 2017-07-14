import React from 'react';
import ReactDOM from 'react-dom';
import { HashRouter, Route } from 'react-router-dom';

import * as APIUtil from "./util/api_util";
import * as Actions from "./actions/pokemon_actions";
import configureStore from './store/store.js';
import Root from './components/root';
import { selectAllPokemon } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store } />, root );

  window.store = store;
});
