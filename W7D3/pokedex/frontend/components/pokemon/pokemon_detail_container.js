import { connect } from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import { PokemonDetail } from './pokemon_detail';

const mapStateToProps = (state, ownProps) => ({
  pokemon: state.pokemon.entities[state.pokemon.currentPoke]
});

const mapDispatchToProps = (dispatch) => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
