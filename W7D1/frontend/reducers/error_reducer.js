import React from "react";
import merge from "lodash/merge";

const errorReducer = (state = {}, action) => {
  Object.freeze(state);
  const newState = merge({}, state);
};
