export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const REQUEST_ALL_POKEMON = "REQUEST_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
import * as APIUtil from '../util/api_util';
import receiveItem from './item_action';

//synchronous actions
export const receiveAllPokemon = (pokemon) => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const receiveSinglePokemon = (pokemon) => {
  return {
    type: RECEIVE_SINGLE_POKEMON,
    pokemon
  };
};

//async actions
export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const requestSinglePokemon = (id) => (dispatch) => (
  APIUtil.fetchSinglePokemon(id)
    .then(pokemon => {
      dispatch(receiveSinglePokemon(pokemon));
      dispatch(receiveItem(pokemon.item));
    })
);
