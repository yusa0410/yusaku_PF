class FavoritesController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    favorite = current_user.favorites.new(movie_id: @movie.id)
    favorite.save
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    favorite = current_user.favorites.find_by(movie_id: @movie.id)
    favorite.destroy
  end

end
