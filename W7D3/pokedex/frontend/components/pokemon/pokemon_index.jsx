import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';
import PokemonDetailContainer from "./pokemon_detail_container";
import { Route } from 'react-router-dom';

export class PokemonIndex extends React.Component {
  constructor (props) {
    super(props);
  }

  componentDidMount () {
    this.props.requestAllPokemon();
  }
  render () {
    return (

      <div>
        <section class="main-flex-container">
        <section class='pokedex'>
        <ul >

          {this.props.pokemon.map((el, i) => (

            <PokemonIndexItem
              image={ el.image_url }
              name={ el.name }
              id={el.id}
              key={ el.id }
              />

          ))}

        </ul>
        </section>
        <section>
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
        </section>
        </section>
      </div>
    );
  }
}
