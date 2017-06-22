class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render(
        json: @artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: selected_artwork
  end

  def update
    @artwork = selected_artwork
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages
    end
  end

  def destroy
    @artwork = selected_artwork
    @artwork.destroy
    render json: @artwork
  end

  private

  def selected_artwork
    Artwork.find_by(id: params[:id])

  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id  )
  end

end
