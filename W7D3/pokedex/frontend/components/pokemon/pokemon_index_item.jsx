import React from 'react';
import { Link } from 'react-router-dom';

export const PokemonIndexItem = (props) => {
  return (
      <li >
        <Link to={`/pokemon/${props.id}`} >
          <img src={ props.image } />
          { props.name }
        </Link>
      </li>
  );
};
