class GenresController < ApplicationController
  def show
    find_genre
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(permit_params)
    redirect_to genre_path(@genre)
  end

  def edit
    find_genre
  end

  def update
    @genre = Genre.update(permit_params)
    redirect_to genre_path(@genre)
  end

  private

  def permit_params
    params.require(:genre).permit(:name)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end
end
