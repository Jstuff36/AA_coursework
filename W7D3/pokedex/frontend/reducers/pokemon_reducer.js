import { merge } from 'lodash';
import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {entities: {}, currentPoke: null}, action) => {
  Object.freeze(state);
  const newState = merge({}, state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      newState.entities = action.pokemon;
      return newState;
    case RECEIVE_SINGLE_POKEMON:
      const { id } = action.pokemon;
      newState.entities[id] = action.pokemon ;
      newState.currentPoke = id;
      return newState;
    default:
      return state;
    }
};

export default pokemonReducer;
