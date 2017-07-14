import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';

export class ItemDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  // componentDidMount() {
  //   this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  // }

  render () {
    return (
      <div>
        {this.props.item.id}
        {this.props.item.name}
        {this.props.item.pokemon_id}
        {this.props.item.price}
        {this.props.item.happiness}
        <img src={this.props.item.image_url} />
      </div>
    );

  }
}
