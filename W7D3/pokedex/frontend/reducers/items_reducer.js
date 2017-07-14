import { ITEM } from '../actions/item_action';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = {};
  switch (action.type) {
    case ITEM:
      return action.item;
    default:
      return state;
  }
};

export default itemsReducer;
