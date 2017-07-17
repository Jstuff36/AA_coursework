import * as APIUtil from '../Util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const signup = (user) => dispatch => {
  const success = resp => dispatch(receiveCurrentUser(resp));
  const fail = error => (dispatch(receiveErrors(error.responeJSON)));

  return APIUtil.signup(user).then(success, fail);
};

export const login = (user) => dispatch => {
  const success = resp => dispatch(receiveCurrentUser(resp));
  const fail = error => dispatch(receiveErrors(error.responseJSON));

  return APIUtil.login(user).then(success, fail);
};

export const logout = () => dispatch => {
  const success = () => dispatch(receiveCurrentUser(null));
  const fail = (errors) => dispatch(receiveErrors(errors));

  return APIUtil.logout().then( success, fail);
};
