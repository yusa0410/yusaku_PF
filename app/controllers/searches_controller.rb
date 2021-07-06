class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.search(params[:search], params[:word])
    else
      @movies = Movie.search(params[:search], params[:word])
    end
  end
end
