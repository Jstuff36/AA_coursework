export const ITEM = "ITEM";

export const receiveItem = (item) => {
  return {
    type: ITEM,
    item
  };
};
