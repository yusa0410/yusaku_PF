class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @user = current_user
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      flash[:notice] = "You have created movie successfully."
      redirect_to  movies_path(@movie.id)
    else
      @movies = Movie.all
      flash[:notice] = "errors prohibited this obj from being saved."
      render "index"
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @user = current_user
    @movie_comment = MovieComment.new
  end

  def index
    @user = current_user
    @movies = Movie.all
    @movie = Movie.new
    @users = User.all
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "You have creatad movie successfully."
      redirect_to movie_path(@movie)
    else
      @movies = Movie.all
      flash[:notice]= "errors prohibited this obj from being saved."
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title,:review,:date,:genre_id)
  end

end
