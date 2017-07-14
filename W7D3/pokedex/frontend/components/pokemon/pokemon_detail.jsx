import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import { ItemDetailContainer } from './item_detail_container';

export class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render () {
    let poke = this.props.pokemon;
    if (!poke) {
      poke = { };
    }
    return (
        <div>
          <section class="pokemon-detail">
            {poke.id} <br />
            {poke.name} <br />
            {poke.attack} <br />
            {poke.defense} <br />
            {poke.moves} <br />
            {poke.poke_type} <br />


          <img src={poke.image_url}/>
          <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
          </section>
        </div>
    );
  }
}
