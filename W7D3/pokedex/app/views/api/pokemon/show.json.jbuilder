json.extract! @pokemon, :id, :name, :attack, :defense, :moves

json.image_url asset_path(@pokemon.image_url)

json.items @pokemon.items do |item|
  # json.id item.id
  # json.name item.name
  # json.price item.price
  # json.happiness item.happiness
  # json.image_url
  json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
end
