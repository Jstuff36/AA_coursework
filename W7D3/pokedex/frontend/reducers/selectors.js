import { values } from "lodash";
export const selectAllPokemon = state => (
  values(state.pokemon.entities)
);

export const selectPokemonItem = (state, itemId) => {
  let match = state.items.filter( (el) => {
    if (el.id === itemId) {
      return el;
    }
  });
  return (match[0]);
};
