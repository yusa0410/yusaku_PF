class MovieCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = MovieComment.new(movie_comment_params)
    @comment.user_id = current_user.id
    @comment.movie_id = @movie.id
    @comment.save
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = MovieComment.find(params[:id])
    @comment.destroy
  end

  private
  def movie_comment_params
    params.require(:movie_comment).permit(:comment)
  end
end
