class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    find_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(permit_params)
    redirect_to song_path(@song)
  end

  def edit
    find_song
  end

  def update
    @song = Song.update(permit_params)
    redirect_to song_path(@song)
  end

  private

  def permit_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
