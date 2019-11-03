class ArtistsController < ApplicationController
  def show
    find_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(permit_params)
    redirect_to artist_path(@artist)
  end

  def edit
    find_artist
  end

  def update
    @artist = Artist.update(permit_params)
    redirect_to artist_path(@artist)
  end

  private

  def permit_params
    params.require(:artist).permit(:name, :bio)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
